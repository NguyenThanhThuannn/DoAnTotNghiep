import '../../../../core/data_state.dart';
import '../../data/model/user_response_model.dart';

abstract class LoginRepository{
  Future<DataState<UserModel>> postLogin(email,password);
}