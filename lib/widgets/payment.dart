import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import '../config/constaint.dart';
import '../features/checkoutpage/presentation/view/checkout_screen.dart';
import '../features/homepage/domain/entities/product.dart';
import '../features/homepage/presentation/view/home_page_screen.dart';
import '../features/loginregisterpage/data/services/provider.dart';

class Payment {
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(
    final context,
    final String total,
    final List<ProductEntity> lst,
    final int shipping_address,
    final int shipping_method_id,
    final int userID,
    final int payment_id
  ) async {
    try {
      log('Payment button clicked');
      paymentIntent = await createPaymentIntent(total, 'VND');
      log('Payment Intent: $paymentIntent');

      const gpay = PaymentSheetGooglePay(
        merchantCountryCode: 'GB',
        currencyCode: 'GBP',
        testEnv: true,
      );

      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], // Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'TTShop',
              googlePay: gpay,
            ),
          )
          .then((final value) {});

      displayPaymentSheet(context, lst,shipping_address,shipping_method_id, total, userID,payment_id);
    } catch (e) {
      print('Error in makePayment: $e');
    }
  }

  Future<void> displayPaymentSheet(
    final context,
    final List<ProductEntity> lst,
    final int shipping_address,
    final int shipping_method_id,
    final String total,
    final int userID,
    final int payment_id
  ) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((final value) async {
        log('Payment Successful');
        await AddOrder(
          userID,
          lst,
          shipping_address,
          shipping_method_id,
          int.parse(total),
          payment_id
        );
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (final context) => const HomePageScreen(),
          ),
          (final route) => false,
        );
      });
    } catch (e) {
      log('Error in displayPaymentSheet: $e');
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
    final String amount,
    final String currency,
  ) async {
    try {
      final Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return json.decode(response.body);
    } catch (err) {
      print('Error in createPaymentIntent: $err');
      throw Exception(err.toString());
    }
  }
}
