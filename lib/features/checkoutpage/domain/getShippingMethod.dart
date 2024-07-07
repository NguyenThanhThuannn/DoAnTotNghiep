import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../../orderpage/domain/entities/order.dart';
import 'shipping_method_repository.dart';

class GetShippingMethodUseCase implements UseCase<DataState<List<ShippingMethodEntity>>, void>{
  GetShippingMethodUseCase(this._shippingMethodRepository);
  final ShippingMethodRepository _shippingMethodRepository;
  
  @override
  Future<DataState<List<ShippingMethodEntity>>> call({void params}) {
    return _shippingMethodRepository.getShippingMethod();
  }
  
}