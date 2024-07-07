// ignore_for_file: only_throw_errors
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../features/checkoutpage/data/shipping_method_response_model.dart';
import '../features/faqpage/data/models/faq_response_model.dart';
import '../features/favoritepage/data/favourite_response_model.dart';
import '../features/homepage/data/models/product_response_model.dart';
import '../features/homepage/domain/entities/product.dart';
import '../features/loginregisterpage/data/model/user_model.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/domain/entities/user.dart';
import '../features/orderpage/data/model/order_response_model.dart';
import '../features/policypage/data/models/policy_response_model.dart';
import '../features/shopbycategorypage/data/models/category_response_model.dart';
import '../features/termpage/data/models/term_response_model.dart';
import 'api_provider.dart';
import 'end_points.dart';
import 'network_helper.dart';

class Api {
  /* Api._internal();
  static Api instance = Api._internal(); */

  static final ApiProvider http = ApiProvider();

  /* static Future<Map<String, dynamic>> getHeaders({
    final bool useConfigToken = false,
  }) async {
    const version = '1.0.0';
    const tokenApi =
        'GHSAT0AAAAAACPH4DD3OWPR75SZZO6S6IVQZRM5MCA';
    return {
      'version': version,
      'token': tokenApi,
    };
  } */

  Future<ProductResponseModel?> getProduct() async{
    try{
      final res = await http.getRequest(EndPoints.product);
      final result = ProductResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('ProductResponseModel lỗi $e');
      return null;
    }
  }
  
  Future<CategoryResponseModel?> getCategory() async{
    try{
      final res = await http.getRequest(EndPoints.category);
      final result = CategoryResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('CategoryResponseModel lỗi $e');
      return null;
    }
  }

  Future<UserResponseModel?> getUserById(final int userId) async{
    try{
      final res = await http.getRequest('${EndPoints.user}/$userId');
      final result = UserResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('UserResponseModel lỗi $e');
      return null;
    }
  }

  Future<OrderResponseModel?> getOrder(final int userId) async {
    try{
      final res = await http.getRequest('${EndPoints.order}/$userId');
      final result = OrderResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('OrderResponseModel lỗi $e');
      return null;
    }
  }

  Future<FavouriteResponseModel?> getFavourite(final int userId) async {
    try{
      final res = await http.getRequest('${EndPoints.user}/${EndPoints.favourite}/$userId');
      final result = FavouriteResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('FavouriteResponseModel lỗi $e');
      return null;
    }
  }

  Future<ShippingMethodResponse?> getShippingMethod() async {
    try{
      final res = await http.getRequest(EndPoints.shippingmethod);
      final result = ShippingMethodResponse.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('OrderResponseModel lỗi $e');
      return null;
    }
  }

  /* Future<UserResponseModel?> addProductInCart(final int userId, final ProductEntity pro, final int qty) async {
    try{
      final res = await http.postRequest('shopping_cart/${EndPoints.user}',
        body: {
          'cart_id': userId,
          'product_item_id': pro.id,
          'qty': qty,
          'product_image': pro.product_image,
        },        
      );
      log('Thêm thành công');
      final result = UserResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('Lỗi khi thêm sản phẩm vào giỏ: $e');
      return null;
    }
  } */

  Future<UserResponseModel?> updateUser(final User user)async{
    try{
      final res = await http.putRequest('${EndPoints.user}/${user.id}',
        body: UserModel().toJson(),        
      );
      final result = UserResponseModel.fromJson(res!);
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('UserResponseModel lỗi $e');
      return null;
    }
  }

  Future<PolicyResponseModel?> getPolicy() async {
    try{
      final res = await Dio().get('${EndPoints.baseUrlGit}${EndPoints.policy}');
      final result = PolicyResponseModel.fromJson(jsonDecode(res.data));
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('PolicyResponseModel lỗi $e');
      return null;
    }
  }

  Future<TermResponseModel?> getTerm() async {
    try{
      final res = await Dio().get('${EndPoints.baseUrlGit}${EndPoints.term}');
      final result = TermResponseModel.fromJson(jsonDecode(res.data));
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('TermResponseModel lỗi $e');
      return null;
    }
  }
  
  Future<FAQResponseModel?> getFAQ() async {
    try{
      final res = await Dio().get('${EndPoints.baseUrlGit}${EndPoints.faq}');
      final result = FAQResponseModel.fromJson(jsonDecode(res.data));
      handleExceptionCase(result.code);
      return result;
    } catch(e){
      log('FAQResponseModel lỗi $e');
      return null;
    }
  }
}