import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_bestselling.dart';
import '../../domain/usecases/get_dailydeals.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(this._getBestSellingUseCase) : super(const HomePageLoading()) {
    on<GetBestSellings>(onGetBestSellings);
  }
  final GetBestSellingUseCase _getBestSellingUseCase;
  Future<void> onGetBestSellings (final GetBestSellings event, final Emitter<HomePageState> emit) async{
    final dataState = await _getBestSellingUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageError(dataState.error!));
    }
  }
}
