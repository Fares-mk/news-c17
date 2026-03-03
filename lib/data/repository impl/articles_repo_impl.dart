import 'package:injectable/injectable.dart';
import 'package:news_c17/data/data%20source/articles_dao.dart';
import 'package:news_c17/data/model/article_response/Article_response.dart';
import 'package:news_c17/repository/articles_repo.dart';
@Injectable(as:ArticlesRepo )
class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesDao articlesDao;
  ArticlesRepoImpl(this.articlesDao);
  @override
  Future<ArticleResponse?> fetchArticles(String sourceId) {
    // TODO: implement fetchArticles
    return articlesDao.fetchArticles(sourceId);
  }
}