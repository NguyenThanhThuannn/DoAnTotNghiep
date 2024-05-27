import '../../../../config/constaint.dart';
import '../../domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    final String ? author,
    final String ? title,
    final String ? description,
    final String ? url,
    final String ? urlToImage,
    final String ? publishedAt,
    final String ? content,
  }): super(
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(final Map < String, dynamic > map) {
    return ArticleModel(
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != '' ? map['urlToImage'] : kDefaultImage,
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
}