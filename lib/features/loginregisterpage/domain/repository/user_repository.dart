import '../../../../core/data_state.dart';
import '../entities/user.dart';

abstract class UserRepository{
  Future<DataState<User>> getUserById(final int id);
  Future<DataState<User>> updateUser(User user);
}