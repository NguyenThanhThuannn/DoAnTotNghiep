part of 'policy_screen_bloc.dart';

sealed class PolicyScreenState extends Equatable {
  const PolicyScreenState({this.policy, this.error});
  final List<PolicyItemEntity> ? policy;
  final DioError ? error;
  @override
  List<Object> get props => [policy!,error!];
}

final class PolicyScreenLoading extends PolicyScreenState {}
final class PolicyScreenLoaded extends PolicyScreenState {
  PolicyScreenLoaded(List<PolicyItemEntity> policy):super(policy: policy);
}
final class PolicyScreenError extends PolicyScreenState {
  PolicyScreenError(DioError error):super(error: error);
}