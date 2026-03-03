import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/data/data%20source/articles_dao.dart';
import 'package:news_c17/data/model/article_response/Article_response.dart';
@Injectable(as: ArticlesDao)
class ArticlesApiImpl implements ArticlesDao{
  ApiManager apiManager;
  ArticlesApiImpl(this.apiManager);
  @override
  Future<ArticleResponse?> fetchArticles(String sourceId) {
    // TODO: implement fetchArticles
    return apiManager.getArticles(sourceId);
  }

}