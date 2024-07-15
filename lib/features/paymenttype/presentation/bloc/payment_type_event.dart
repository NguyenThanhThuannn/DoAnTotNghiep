part of 'payment_type_bloc.dart';

sealed class PaymentTypeEvent{
  const PaymentTypeEvent();
}
class GetPaymentTypes extends PaymentTypeEvent{}
