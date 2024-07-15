part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  const ReviewState({this.review,this.error});
  final List<ReviewEntity> ? review;
  final DioError ? error;
  @override
  List<Object> get props => [review!,error!];
}

final class ReviewLoading extends ReviewState {}
final class ReviewLoaded extends ReviewState {
  ReviewLoaded(List<ReviewEntity> review):super(review: review);
}
final class ReviewError extends ReviewState {
  ReviewError(DioError error):super(error: error);
}