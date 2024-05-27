part of 'blog_page_bloc.dart';

sealed class BlogPageState extends Equatable {
  const BlogPageState({this.article,this.error});
  final List<ArticleEntity> ? article;
  final DioError ? error;
  @override
  List<Object> get props => [article!,error!];
}

final class BlogPageLoading extends BlogPageState {}
final class BlogPageLoaded extends BlogPageState {
  BlogPageLoaded(List<ArticleEntity> article):super(article: article);
}
final class BlogPageError extends BlogPageState {
  BlogPageError(DioError error):super(error: error);
}