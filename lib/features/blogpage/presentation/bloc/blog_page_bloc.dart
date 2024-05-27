import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../data/data_source/remote/newapiS.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_article.dart';

part 'blog_page_event.dart';
part 'blog_page_state.dart';

class BlogPageBloc extends Bloc<BlogPageEvent, BlogPageState> {
  BlogPageBloc(this._getArticleUseCase) : super(BlogPageLoading()) {
    on<GetArticles>(onGetArticles);
  }
  final GetArticleUseCase _getArticleUseCase;
  Future<void> onGetArticles(final GetArticles event, final Emitter<BlogPageState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSucces && dataState.data!.isNotEmpty) {
      emit(BlogPageLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(BlogPageError(dataState.error!));
    }
  }
}
