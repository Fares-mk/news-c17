import 'package:flutter/material.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/model/source_response/Source.dart';

class ArticleScreenViewmodel extends ChangeNotifier{
  bool isloading=false;
  String? errormssage;
  List<Article>? articles=[];

  getArticles(String categoryId)async{
    errormssage=null;
    articles=null;
    try{
      isloading=true;
      var response=await ApiManager.getArticles(categoryId);
      isloading=false;
      notifyListeners();
      if(response?.status!="error"){

        articles=response?.articles??[];
      }
      if(response?.status=="error"){
        errormssage=response?.message;
      }
      notifyListeners();
    }catch(e){
      isloading=false;
      errormssage="no internet connection";
      notifyListeners();
    }

  }
}