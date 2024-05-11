import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/term.dart';
import '../../domain/usecases/get_term.dart';

part 'term_page_event.dart';
part 'term_page_state.dart';

class TermPageBloc extends Bloc<TermPageEvent, TermPageState> {
  TermPageBloc(this._getTermUseCase) : super(TermPageLoading()) {
    on<GetTerms>(onGetTerm);
  }
  final GetTermUseCase _getTermUseCase;
  Future<void> onGetTerm(GetTerms event,Emitter<TermPageState> emit) async {
    final dataState = await _getTermUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(TermPageLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(TermPageError(dataState.error!));
    }
  }
}
