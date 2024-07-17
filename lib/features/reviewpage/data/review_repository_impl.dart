import '../../../core/data_state.dart';
import '../../../network/api.dart';
import '../domain/review.dart';
import '../domain/review_repository.dart';
import 'package:dio/dio.dart';
class ReviewRepositoryImpl implements ReviewRepository{
  ReviewRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<ReviewEntity>>> getReview(int productID) async {
    try{
    final res = await _api.getReview(productID);
    return DataSucces(res!.data);
   } on DioError catch(e){
    return DataFailed(e);
   }
  }
}