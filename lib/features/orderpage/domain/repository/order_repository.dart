import '../../../../core/data_state.dart';
import '../entities/order.dart';

abstract class OrderRepository{
  Future<DataState<List<OrderEntity>>> getOrder(int id);
}