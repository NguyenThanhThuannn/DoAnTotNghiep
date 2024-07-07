import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../repository/user_repository.dart';

class DeleteProductInCartUseCase implements UseCase<DataState<void>, int>{
  DeleteProductInCartUseCase(this._userRepository);
  final UserRepository _userRepository;
  
  @override
  Future<DataState<void>> call({int? params}) {
    return _userRepository.deleteProductInCart(params!);
  }
}