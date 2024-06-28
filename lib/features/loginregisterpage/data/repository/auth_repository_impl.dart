import '../../domain/entities/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl(this.authService);
  final AuthService authService;

  @override
  Future<User> login(final String email, final String password) async {
    final userModel = await authService.login(email, password);
    return User(id: userModel.id, token: userModel.token);
  }
  @override
  Future<User> signup(final String name,final String email, final String password, String password_confirmation) async {
    final userModel = await authService.signup(name, email, password,password);
    return User(name: userModel.name, email: userModel.email, password: userModel.password, password_confirmation: userModel.password_confirmation);
  }
  
}
