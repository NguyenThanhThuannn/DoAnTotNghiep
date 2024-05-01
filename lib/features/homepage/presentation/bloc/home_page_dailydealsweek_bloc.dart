import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_dailydealsweek.dart';
part 'home_page_dailydealsweek_event.dart';
part 'home_page_dailydealsweek_state.dart';

class HomePageDailydealsweekBloc extends Bloc<HomePageDailydealsweekEvent, HomePageDailydealsweekState> {
  HomePageDailydealsweekBloc(this._getDailyDealsWeekUseCase) : super(HomePageDailydealsweekLoading()) {
    on<GetDailyDealsWeek>(onGetDailyDealsWeek);
  }
  final GetDailyDealsWeekUseCase _getDailyDealsWeekUseCase;
  Future<void> onGetDailyDealsWeek (final GetDailyDealsWeek event, final Emitter<HomePageDailydealsweekState> emit) async{
    final dataState = await _getDailyDealsWeekUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageDailydealsweekLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageDailydealsweekError(dataState.error!));
    }
  }
}
