import '../../../../core/data_state.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../data/model/user_model.dart';
import '../entities/user.dart';

abstract class UserRepository{
  Future<DataState<User>> getUserById(final int id);
  Future<DataState<ShoppingCartItems>> addProductInCart(int userId, ProductEntity product, int qty);
  Future<DataState<void>> deleteProductInCart(final int id);
  Future<DataState<User>> updateUser(User user);
}