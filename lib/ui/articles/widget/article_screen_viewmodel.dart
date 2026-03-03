import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c17/repository/articles_repo.dart';

import 'package:news_c17/ui/articles/widget/article_states.dart';
@injectable
class ArticleScreenViewmodel extends Cubit<ArticleStates> {
  ArticleScreenViewmodel(this.articlesRepo):super(LoadingState());
   ArticlesRepo articlesRepo;
  getArticles(categoryId)async{
    try{
      emit(LoadingState());
      var response=await articlesRepo.fetchArticles(categoryId);
      if(response?.status!='error'){
        emit(SuccessState(response?.articles??[]));
      }
      else {
        emit(ErrorState(response?.message??""));
      }
    }catch(e){
      emit(ErrorState("No internet connection"));
    }
  }
}


//mvvvm provider
// class ArticleScreenViewmodel extends ChangeNotifier{
//   bool isloading=false;
//   String? errormssage;
//   List<Article>? articles=[];
//
//   getArticles(String categoryId)async{
//     errormssage=null;
//     articles=null;
//     try{
//       isloading=true;
//       var response=await ApiManager.getArticles(categoryId);
//       isloading=false;
//       notifyListeners();
//       if(response?.status!="error"){
//
//         articles=response?.articles??[];
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