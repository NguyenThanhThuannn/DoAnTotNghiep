import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/getReview.dart';
import '../../domain/review.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc(this._getReviewUseCase) : super(ReviewLoading()) {
    on<GetReview>(onGetReview);
  }
  Future<void> onGetReview (final GetReview event, final Emitter<ReviewState> emit) async{
    
    final dataState = await _getReviewUseCase(params: event.productID);
    if(dataState is DataSucces && dataState.data!=null){
      //emit(UserLoading());
      emit(ReviewLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(ReviewError(dataState.error!));
    }
  }
  final GetReviewUseCase _getReviewUseCase;
}
