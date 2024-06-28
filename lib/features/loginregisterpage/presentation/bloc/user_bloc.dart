import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/getuserbyid_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._getUserByIdUseCase) : super(UserLoading()) {
    on<GetUserById>(onGetUserById);
  }
  final GetUserByIdUseCase _getUserByIdUseCase;
  Future<void> onGetUserById (final GetUserById event, final Emitter<UserState> emit) async{
    final dataState = await _getUserByIdUseCase(params: event.userId);
    if(dataState is DataSucces && dataState.data!=null){
      emit(UserLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(UserError(dataState.error!));
    }
  }
}
