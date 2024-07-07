part of 'user_bloc.dart';

sealed class UserEvent{
  const UserEvent();
}
class GetUserById extends UserEvent{

  const GetUserById(this.userId);
  final int userId;

  @override
  List<Object?> get props => [userId];
}
class GetUserById2 extends UserEvent{

  const GetUserById2(this.userId);
  final int userId;

  @override
  List<Object?> get props => [userId];
}

class AddProduct extends UserEvent {

  AddProduct(this.userId, this.product, this.qty);
  final int userId;
  final ProductEntity product;
  final int qty;
}

class DeleteProduct extends UserEvent {
  DeleteProduct(this.cartId);
  final int cartId;
}