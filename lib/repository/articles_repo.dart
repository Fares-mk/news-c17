import 'package:news_c17/data/model/article_response/Article_response.dart';

abstract interface class ArticlesRepo {
  Future<ArticleResponse?> fetchArticles(String sourceId);
}