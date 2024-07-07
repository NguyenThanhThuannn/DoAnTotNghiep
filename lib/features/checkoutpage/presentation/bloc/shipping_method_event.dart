part of 'shipping_method_bloc.dart';

sealed class ShippingMethodEvent{
  const ShippingMethodEvent();
}
class GetShippingMethods extends ShippingMethodEvent{}