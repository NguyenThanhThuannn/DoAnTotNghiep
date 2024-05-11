import '../../../../core/data_state.dart';
import '../../../../network/api.dart';
import '../../domain/entities/term.dart';
import '../../domain/repository/term_repository.dart';
import 'package:dio/dio.dart';

class TermRepositoryImpl implements TermRepository {
  TermRepositoryImpl(this._api);
  final Api _api;

  @override
  Future<DataState<List<TermItemEntity>>> getTermUseCase() async {
    try {
      final res = await _api.getTerm();
      return DataSucces(res!.data.term);
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
