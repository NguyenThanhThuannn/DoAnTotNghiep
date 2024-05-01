import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_dailydealsweek2.dart';
part 'home_page_dailydealsweek2_event.dart';
part 'home_page_dailydealsweek2_state.dart';

class HomePageDailydealsweek2Bloc extends Bloc<HomePageDailydealsweek2Event, HomePageDailydealsweek2State> {
  HomePageDailydealsweek2Bloc(this._getDailyDealsWeek2UseCase) : super(HomePageDailydealsweek2Loading()) {
    on<GetDailyDealsWeek2>(onGetDailyDealsWeek2);
  }
  final GetDailyDealsWeek2UseCase _getDailyDealsWeek2UseCase;
  Future<void> onGetDailyDealsWeek2 (final GetDailyDealsWeek2 event, final Emitter<HomePageDailydealsweek2State> emit) async{
    final dataState = await _getDailyDealsWeek2UseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageDailydealsweek2Loaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageDailydealsweek2Error(dataState.error!));
    }
  }
}
