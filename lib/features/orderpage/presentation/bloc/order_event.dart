part of 'order_bloc.dart';

sealed class OrderEvent{
  const OrderEvent();
}
class GetOrders extends OrderEvent{
  GetOrders(this.userId);
  int userId;
  
   @override
  List<Object?> get props => [userId];
}
class GetOrders2 extends OrderEvent{
  GetOrders2(this.userId);
  int userId;
  
   @override
  List<Object?> get props => [userId];
}