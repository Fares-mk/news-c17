import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/core/resources/app_constants.dart';

import '../../../data/model/article_response/Article_response.dart';
import '../../../data/model/source_response/Source_response.dart';

@lazySingleton
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
    Future<SourceResponse?> getSources(String category)async{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "category": category
    });
     SourceResponse sourceResponse =SourceResponse.fromJson(response.data);
     return sourceResponse;
    }
     Future<ArticleResponse?> getArticles(String sourceId ,)async{
    var response=await dio.get("/v2/everything",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "sources":sourceId,

    });
    var artileResponse= ArticleResponse.fromJson(response.data);
    return artileResponse;
    }
  static Future<ArticleResponse?> getSearch(String query)async{
    var response=await dio.get("/v2/everything",queryParameters: {
      "apiKey":AppConstants.apiKey,
      "q":query,
      "pageSize":5

    });
    var artileResponse= ArticleResponse.fromJson(response.data);
    return artileResponse;
  }
}