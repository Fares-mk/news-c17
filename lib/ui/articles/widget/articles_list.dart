import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';
import 'package:news_c17/ui/articles/widget/article_screen_viewmodel.dart';
import 'package:news_c17/ui/articles/widget/article_states.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatelessWidget {
  String articleId;
  List<Article>? filteredList;

  ArticlesList({this.articleId = "", this.filteredList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleScreenViewmodel()..getArticles(articleId),
      child: BlocBuilder<ArticleScreenViewmodel,ArticleStates>(builder: (context, state) {
        switch(state){

          case LoadingState():
            // TODO: Handle this case.
            return Center(child: CircularProgressIndicator());
          case ErrorState():
            // TODO: Handle this case.
        return Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.errormessage,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ApiManager.getArticles(articleId);
                        },
                        child: Text(
                          "Try again",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                );
          case SuccessState():
            // TODO: Handle this case.
            // if(filteredList==null||filteredList!.isEmpty) {
            //   filteredList = state.article;
            // }
                return ListView.separated(
                itemBuilder: (context, index) =>
                    ArticleItem(article: state.article[index]),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: state.article.length,
              );
        }
      },),
    );

    // mvvm provider
    // return ChangeNotifierProvider(
    //   create: (context) => ArticleScreenViewmodel()..getArticles(articleId),
    //   child: Consumer<ArticleScreenViewmodel>(
    //     builder: (context, viewmodel, child) {
    //       if (viewmodel.isloading) {
    //         return Center(child: CircularProgressIndicator());
    //       } else if (viewmodel.errormssage != null) {
    //         return Container(
    //           width: double.infinity,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 viewmodel.errormssage!,
    //                 style: Theme.of(context).textTheme.headlineMedium,
    //               ),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getArticles(articleId);
    //                 },
    //                 child: Text(
    //                   "Try again",
    //                   style: Theme.of(context).textTheme.labelSmall,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //       if(filteredList==null||filteredList!.isEmpty){
    //         filteredList=viewmodel.articles;
    //       }
    //       return ListView.separated(
    //         itemBuilder: (context, index) =>
    //             ArticleItem(article: filteredList![index]),
    //         separatorBuilder: (context, index) => SizedBox(height: 16.h),
    //         itemCount: filteredList!.length,
    //       );
    //     },
    //   ),
    // );

    // return FutureBuilder(
    //   future: ApiManager.getArticles(articleId),
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState== ConnectionState.waiting){
    //         Center(child: CircularProgressIndicator(),);
    //     }
    //     if(snapshot.hasError){
    //         Text("There is an error");
    //     }
    //     var response=snapshot.data;
    //     List<Article> source=response?.articles??[];
    //     if(filteredList==null||filteredList!.isEmpty){
    //       filteredList=source;
    //     }
    //     return ListView.separated(
    //         itemBuilder: (context, index) => ArticleItem(article: filteredList![index],),
    //         separatorBuilder: (context, index) => SizedBox(height: 16.h,),
    //         itemCount: filteredList!.length
    //     );
    //   }
    // );
  }
}
