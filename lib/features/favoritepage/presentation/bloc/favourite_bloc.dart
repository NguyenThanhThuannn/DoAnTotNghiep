import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/favourite.dart';
import '../../domain/getFavourite.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc(this._getFavouriteUseCase) : super(FavouriteLoading()) {
    on<GetFavourites>(onGetFavourites);
  }
  Future<void> onGetFavourites(final GetFavourites event, final Emitter<FavouriteState> emit) async{
    final dataState = await _getFavouriteUseCase(params: event.userId);
    if(dataState is DataSucces && dataState.data!=null){
      emit(FavouriteLoading());
      emit(FavouriteLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(FavouriteError(dataState.error!));
    }
  }
  final GetFavouriteUseCase _getFavouriteUseCase;
}
