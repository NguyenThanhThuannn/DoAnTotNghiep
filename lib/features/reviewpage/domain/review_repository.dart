import '../../../core/data_state.dart';
import 'review.dart';

abstract class ReviewRepository{
  Future<DataState<List<ReviewEntity>>> getReview(int productID);
}