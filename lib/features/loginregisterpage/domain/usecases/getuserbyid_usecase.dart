import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class GetUserByIdUseCase implements UseCase<DataState<User>, int>{
  GetUserByIdUseCase(this._userRepository);
  final UserRepository _userRepository;
  
  @override
  Future<DataState<User>> call({int? params}) {
    return _userRepository.getUserById(params!);
  }
  
}