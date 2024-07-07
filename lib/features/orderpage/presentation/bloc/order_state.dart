part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState({this.order,this.error});
  final List<OrderEntity> ? order;
  final DioError ? error;
  @override
  List<Object> get props => [order!,error!];
}

final class OrderLoading extends OrderState {}
final class OrderLoaded extends OrderState {
  const OrderLoaded(final List<OrderEntity> order):super(order: order);
}
final class OrderError extends OrderState {
  const OrderError(final DioError e):super(error: e);
}