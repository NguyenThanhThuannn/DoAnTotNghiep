import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_recentbrowsing.dart';

part 'home_page_recentbrowsing_event.dart';
part 'home_page_recentbrowsing_state.dart';

class HomePageRecentbrowsingBloc extends Bloc<HomePageRecentbrowsingEvent, HomePageRecentbrowsingState> {
  HomePageRecentbrowsingBloc(this._getRecentBrowsingUseCase) : super(HomePageRecentbrowsingLoading()) {
    on<GetRecentBrowsing>(onGetRecentBrowsing);
  }
  final GetRecentBrowsingUseCase _getRecentBrowsingUseCase;
  Future<void> onGetRecentBrowsing (final GetRecentBrowsing event, final Emitter<HomePageRecentbrowsingState> emit) async{
    final dataState = await _getRecentBrowsingUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageRecentbrowsingLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageRecentbrowsingError(dataState.error!));
    }
  }
}
