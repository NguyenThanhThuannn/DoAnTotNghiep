import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../../../../../config/constaint.dart';
import '../../models/article_model.dart';

part 'newapiS.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewApiS {
  factory NewApiS(final Dio dio) = _NewApiS;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles({
    @Query('apiKey') final String ? apiKey,
    @Query('sources') final String ? sources,
  });
}