import '../../../../core/data_state.dart';
import '../../domain/entities/policy.dart';

abstract class PolicyRepository{
  Future<DataState<List<PolicyItemEntity>>> getPolicyUseCase();
}