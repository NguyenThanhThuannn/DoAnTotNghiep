import '../../../core/data_state.dart';
import '../../../core/usecase.dart';
import 'review.dart';
import 'review_repository.dart';

class GetReviewUseCase implements UseCase<DataState<List<ReviewEntity>>, int>{
  GetReviewUseCase(this._reviewRepository);
  final ReviewRepository _reviewRepository;
  
  @override
  Future<DataState<List<ReviewEntity>>> call({int? params}) {
    return _reviewRepository.getReview(params!);
  }
}