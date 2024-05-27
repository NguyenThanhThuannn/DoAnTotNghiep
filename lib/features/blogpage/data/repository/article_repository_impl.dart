import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../config/constaint.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_source/remote/newapiS.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl(this._newApiS);
  final NewApiS _newApiS;

  @override
  Future<DataState<List<ArticleEntity>>> getArticles() async {
    try {
      final httpResponse = await _newApiS.getArticles(
        apiKey: newsAPIKey,
        sources: sourceQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSucces(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              requestOptions: httpResponse.response.requestOptions,
              response: httpResponse.response,
              type: DioExceptionType.badResponse),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
