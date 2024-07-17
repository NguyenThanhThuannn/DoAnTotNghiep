import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../data/model/user_model.dart';
import '../repository/user_repository.dart';

class AddProductInCartUseCase implements UseCase<DataState<ShoppingCartItems>, AddProductParams> {
  final UserRepository _userRepository;

  AddProductInCartUseCase(this._userRepository);

  @override
  Future<DataState<ShoppingCartItems>> call({AddProductParams? params}) async {
    return await _userRepository.addProductInCart(params!.userId, params.product, params.qty);
  }
}

class AddProductParams {
  final int userId;
  final ProductEntity product;
  final int qty;

  AddProductParams(this.userId, this.product, this.qty);
}
