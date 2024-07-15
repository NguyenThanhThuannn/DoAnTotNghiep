part of 'review_bloc.dart';

sealed class ReviewEvent {
  const ReviewEvent();
}
class GetReview extends ReviewEvent{

  const GetReview(this.productID);
  final int productID;

  @override
  List<Object?> get props => [productID];
}