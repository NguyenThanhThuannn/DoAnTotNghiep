import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class UpdateUserUseCase implements UseCase<DataState<User>, User>{
  UpdateUserUseCase(this._userRepository);
  final UserRepository _userRepository;
  
  @override
  Future<DataState<User>> call({User? params}) {
    return _userRepository.updateUser(params!);
  }
  
}