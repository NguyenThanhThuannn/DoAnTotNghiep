import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/order.dart';
import '../repository/order_repository.dart';

class GetOrderUseCase implements UseCase<DataState<List<OrderEntity>>, int>{
  GetOrderUseCase(this._userRepository);
  final OrderRepository _userRepository;
  
  @override
  Future<DataState<List<OrderEntity>>> call({int? params}) {
    return _userRepository.getOrder(params!);
  }
  
}