import 'package:flutter/material.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/model/source_response/Source.dart';

class SourceScreenViewmodel extends ChangeNotifier{
  bool isloading=false;
  String? errormssage;
  List<Source> articles=[];

  getSources(String categoryId)async{
    errormssage=null;
    articles=[];
    try{
      isloading=true;
      var response=await ApiManager.getSources(categoryId);
      isloading=false;
      notifyListeners();
      if(response?.status!="error"){

        articles=response?.sources??[];
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