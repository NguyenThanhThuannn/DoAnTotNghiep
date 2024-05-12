import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/entities/faq.dart';
import '../../domain/repository/faq_repository.dart';
import 'package:dio/dio.dart';
class FAQRepositoryImpl implements FAQRepository{
  FAQRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<FAQItemEntity>>> getFAQUseCase() async {
    try {
      final res = await _api.getFAQ();
      return DataSucces(res!.data.FAQ);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}