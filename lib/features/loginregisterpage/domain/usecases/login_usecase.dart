import '../entities/user.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<User> execute(String email, String password) {
    return authRepository.login(email, password);
  }
}
