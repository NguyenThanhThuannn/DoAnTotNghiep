part of 'shipping_method_bloc.dart';

sealed class ShippingMethodState extends Equatable {
  const ShippingMethodState({this.shipping_method,this.error});
  final List<ShippingMethodEntity>? shipping_method;
  final DioError ? error;
  @override
  List<Object> get props => [shipping_method!,error!];
}

final class ShippingMethodLoading extends ShippingMethodState {}
final class ShippingMethodLoaded extends ShippingMethodState {
  ShippingMethodLoaded(List<ShippingMethodEntity> shipping_method):super(shipping_method: shipping_method);
}
final class ShippingMethodError extends ShippingMethodState {
  ShippingMethodError(DioError ? error):super(error: error);
}