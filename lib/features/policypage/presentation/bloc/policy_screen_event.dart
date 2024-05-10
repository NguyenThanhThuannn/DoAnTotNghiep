part of 'policy_screen_bloc.dart';

sealed class PolicyScreenEvent {
  const PolicyScreenEvent();
}
class GetPolicies extends PolicyScreenEvent{}
