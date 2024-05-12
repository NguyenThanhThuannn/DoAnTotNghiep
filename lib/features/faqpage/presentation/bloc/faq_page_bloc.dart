import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/faq.dart';
import '../../domain/usecases/get_faq.dart';

part 'faq_page_event.dart';
part 'faq_page_state.dart';

class FaqPageBloc extends Bloc<FaqPageEvent, FaqPageState> {
  FaqPageBloc(this._getFAQUseCase) : super(FaqPageLoading()) {
    on<GetFAQs>(onGetFAQ);
  }
  final GetFAQUseCase _getFAQUseCase;
  Future<void> onGetFAQ(GetFAQs event,Emitter<FaqPageState> emit) async {
    final dataState = await _getFAQUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(FaqPageLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(FaqPageError(dataState.error!));
    }
  }
}
