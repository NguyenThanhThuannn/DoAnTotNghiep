import '../../../../core/data_state.dart';
import '../../../../core/usecase.dart';
import '../../data/repository/policy_repository_impl.dart';
import '../entities/policy.dart';

class GetPolicyUseCase implements UseCase<DataState<List<PolicyItemEntity>>,void>{
  GetPolicyUseCase(this._policyRepository);
  final PolicyRepository _policyRepository;
  
  @override
  Future<DataState<List<PolicyItemEntity>>> call({void params}) {
    return _policyRepository.getPolicyUseCase();
  }
}