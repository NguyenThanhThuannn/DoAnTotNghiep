part of 'blog_page_bloc.dart';

sealed class BlogPageEvent {
  const BlogPageEvent();
}
class GetArticles extends BlogPageEvent{}