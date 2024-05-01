import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_hotnewarrival.dart';

part 'home_page_hotnewarrival_event.dart';
part 'home_page_hotnewarrival_state.dart';

class HomePageHotnewarrivalBloc extends Bloc<HomePageHotnewarrivalEvent, HomePageHotnewarrivalState> {
  HomePageHotnewarrivalBloc(this._getHotNewArrivalUseCase) : super(HomePageHotnewarrivalLoading()) {
    on<GetHotNewArrivals>(onGetHotNewArrival);
  }
  final GetHotNewArrivalUseCase _getHotNewArrivalUseCase;
  Future<void> onGetHotNewArrival (final GetHotNewArrivals event, final Emitter<HomePageHotnewarrivalState> emit) async{
    final dataState = await _getHotNewArrivalUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageHotnewarrivalLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageHotnewarrivalError(dataState.error!));
    }
  }
}
