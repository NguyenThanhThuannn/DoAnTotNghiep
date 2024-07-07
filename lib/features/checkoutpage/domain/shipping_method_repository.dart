import '../../../core/data_state.dart';
import '../../orderpage/domain/entities/order.dart';

abstract class ShippingMethodRepository{
  Future<DataState<List<ShippingMethodEntity>>> getShippingMethod();
}