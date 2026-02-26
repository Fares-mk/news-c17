import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/widget/article_item.dart';

class ArticlesList extends StatelessWidget {
  String articleId;
  List<Article>? filteredList;
  ArticlesList({ this.articleId="", this.filteredList});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(articleId),
      builder: (context, snapshot) {
        if(snapshot.connectionState== ConnectionState.waiting){
            Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError){
            Text("There is an error");
        }
        var response=snapshot.data;
        List<Article> source=response?.articles??[];
        if(filteredList==null||filteredList!.isEmpty){
          filteredList=source;
        }
        return ListView.separated(
            itemBuilder: (context, index) => ArticleItem(article: filteredList![index],),
            separatorBuilder: (context, index) => SizedBox(height: 16.h,),
            itemCount: filteredList!.length
        );
      }
    );
  }
}
