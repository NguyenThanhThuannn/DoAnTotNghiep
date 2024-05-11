import '../../../../core/data_state.dart';
import '../entities/policy.dart';


abstract class PolicyRepository{
  Future<DataState<List<PolicyItemEntity>>> getPolicyUseCase();
}