import 'package:dio/dio.dart';
import 'package:news_c17/core/resources/app_constants.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/model/article_response/Article_response.dart';
import 'package:news_c17/model/source_response/Source_response.dart';

class ApiManager {
  static late Dio dio;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: AppConstants.baseUrl
        )
    );
  }
  //
  static  Future<SourceResponse?> getSources(String category)async{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "category": category
    });
     SourceResponse sourceResponse =SourceResponse.fromJson(response.data);
     return sourceResponse;
    }
    static Future<ArticleResponse?> getArticles(String? sourceId ,String? query)async{
    var response=await dio.get("/v2/everything",queryParameters: {
      "apiKey":AppConstants.apiKey,
      if(sourceId!=null)"sources":sourceId,
      if(query!=null)"q":query

    });
    var artileResponse= ArticleResponse.fromJson(response.data);
    return artileResponse;
    }

}