import '../entities/user.dart';
import '../repository/auth_repository.dart';

class SignupUseCase {
  SignupUseCase(this.authRepository);
  final AuthRepository authRepository;

  Future<User> execute(final String name, final String email,
      final String password, String password_confirmation) {
    return authRepository.signup(name, email, password, password_confirmation);
  }
}
