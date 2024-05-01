import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_dailydeals.dart';

part 'home_page_dailydeals_event.dart';
part 'home_page_dailydeals_state.dart';

class HomePageDailydealsBloc extends Bloc<HomePageDailydealsEvent, HomePageDailydealsState> {
  HomePageDailydealsBloc(this._getDailyDealsUseCase) : super(HomePageDailydealsLoading()) {
    on<GetDailyDeals>(onGetDailyDeals);
  }
  final GetDailyDealsUseCase _getDailyDealsUseCase;
  Future<void> onGetDailyDeals (final GetDailyDeals event, final Emitter<HomePageDailydealsState> emit) async{
    final dataState = await _getDailyDealsUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageDailyDealsLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageDailyDealsError(dataState.error!));
    }
  }
}
