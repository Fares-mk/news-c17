import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/model/source_response/Source.dart';
import 'package:news_c17/ui/articles/screen/surces_states.dart';
class SourceScreenViewmodel extends Cubit<SurcesStates>{
  SourceScreenViewmodel():super(LoadingState());

  getSources(String categoryId)async{
    try{
      emit(LoadingState());
      var response=await ApiManager.getSources(categoryId);
      if(response?.status!='error'){
        emit(SuccessState(response?.sources??[]));
      }
      else{
        emit(ErrorState(response?.message??""));
      }
    }catch(e){
      emit(ErrorState("No internet connection"));
    }
  }

}
// class SourceScreenViewmodel extends ChangeNotifier{
//   bool isloading=false;
//   String? errormssage;
//   List<Source> articles=[];
//
//   getSources(String categoryId)async{
//     errormssage=null;
//     articles=[];
//     try{
//       isloading=true;
//       var response=await ApiManager.getSources(categoryId);
//       isloading=false;
//       notifyListeners();
//       if(response?.status!="error"){
//
//         articles=response?.sources??[];
//       }
//       if(response?.status=="error"){
//         errormssage=response?.message;
//       }
//       notifyListeners();
//     }catch(e){
//       isloading=false;
//       errormssage="no internet connection";
//       notifyListeners();
//     }
//
//   }
// }