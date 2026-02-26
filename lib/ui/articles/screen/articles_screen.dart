import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/app_constants.dart';
import 'package:news_c17/core/resources/colors_manager.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/model/article_response/Article_response.dart';
import 'package:news_c17/model/source_response/Source.dart';
import 'package:news_c17/model/source_response/Source_response.dart';
import 'package:news_c17/model/category_model.dart';
import 'package:news_c17/ui/articles/screen/source_screen_viewmodel.dart';
import 'package:news_c17/ui/articles/widget/articles_list.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  CategoryModel category;

  ArticlesScreen(this.category);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      SourceScreenViewmodel()
        ..getSources(widget.category.id),
      child: Consumer<SourceScreenViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.isloading) {
            return Center(child: CircularProgressIndicator());
          }
          else if (viewmodel.errormssage != null) {
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewmodel.errormssage!, style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,),
                  ElevatedButton(onPressed: () {
                    ApiManager.getSources(widget.category.id);
                  }, child: Text("Try again",style: Theme.of(context).textTheme.labelSmall,))
                ],
              ),
            );
          }
          return DefaultTabController(
                  length: viewmodel.articles.length,
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
                        unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        tabs: viewmodel.articles.map((source) => Tab(text: source.name)).toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: viewmodel.articles
                              .map(
                                (source) => Padding(
                                  padding: REdgeInsets.all(16),
                                  child: ArticlesList(articleId: source.id ?? "",),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
        },),
    );
    // FutureBuilder(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //        print(snapshot.error);
    //     }
    //     SourceResponse? response = snapshot.data;
    //     List<Source> sources = response?.sources ?? [];
    //
    //     return DefaultTabController(
    //       length: sources.length,
    //       child: Column(
    //         children: [
    //           TabBar(
    //             labelStyle: Theme.of(
    //               context,
    //             ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
    //             unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium
    //                 ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    //             dividerHeight: 0,
    //             tabAlignment: TabAlignment.start,
    //             isScrollable: true,
    //             tabs: sources.map((source) => Tab(text: source.name)).toList(),
    //           ),
    //           Expanded(
    //             child: TabBarView(
    //               physics: NeverScrollableScrollPhysics(),
    //               children: sources
    //                   .map(
    //                     (source) => Padding(
    //                       padding: REdgeInsets.all(16),
    //                       child: ArticlesList(articleId: source.id ?? "",),
    //                     ),
    //                   )
    //                   .toList(),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
