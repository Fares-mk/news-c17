
import '../../../data/model/article_response/Article.dart';

sealed class ArticleStates {}

class LoadingState extends ArticleStates{}

class ErrorState extends ArticleStates{
  String errormessage;
  ErrorState(this.errormessage);
}
class SuccessState extends ArticleStates{
  List<Article> article;
  SuccessState(this.article);
}
