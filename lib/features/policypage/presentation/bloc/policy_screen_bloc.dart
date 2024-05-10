import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/policy.dart';
import '../../domain/usecases/get_policy.dart';

part 'policy_screen_event.dart';
part 'policy_screen_state.dart';

class PolicyScreenBloc extends Bloc<PolicyScreenEvent, PolicyScreenState> {
  PolicyScreenBloc(this._getPolicyUseCase) : super(PolicyScreenLoading()) {
    on<GetPolicies>(onGetPolicy);
  }
  final GetPolicyUseCase _getPolicyUseCase;
  Future<void> onGetPolicy(GetPolicies event,Emitter<PolicyScreenState> emit) async {
    final dataState = await _getPolicyUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(PolicyScreenLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(PolicyScreenError(dataState.error!));
    }
  }
}
