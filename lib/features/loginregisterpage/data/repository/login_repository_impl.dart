/* import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/repository/login_repository.dart';
import '../model/user_response_model.dart';
import 'package:dio/dio.dart';
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<UserModel>> postLogin(String email, String password) async {
    try {
      final res = await _api.postLogin(email,password);
      return DataSucces(res!);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
} */