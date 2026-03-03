import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/DI/di.dart';

import 'package:news_c17/ui/articles/screen/source_screen_viewmodel.dart';
import 'package:news_c17/ui/articles/screen/surces_states.dart';
import 'package:news_c17/ui/articles/widget/articles_list.dart';

import '../../../data/model/category_model.dart';

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
    return BlocProvider(
      create: (context) =>
          getIt<SourceScreenViewmodel>()..getSources(widget.category.id),
      child: BlocBuilder<SourceScreenViewmodel, SurcesStates>(
        builder: (context, state) {
          switch (state) {
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
                        // ApiManager.getSources(widget.category.id);
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
              return DefaultTabController(
                length: state.sources.length,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                      dividerHeight: 0,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: state.sources
                          .map((source) => Tab(text: source.name))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: state.sources
                            .map(
                              (source) => Padding(
                                padding: REdgeInsets.all(16),
                                child: ArticlesList(articleId: source.id ?? ""),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );

    //mvvm use provider
    // return ChangeNotifierProvider(
    //   create: (context) =>
    //   SourceScreenViewmodel()
    //     ..getSources(widget.category.id),
    //   child: Consumer<SourceScreenViewmodel>(
    //     builder: (context, viewmodel, child) {
    //       if (viewmodel.isloading) {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //       else if (viewmodel.errormssage != null) {
    //         return Container(
    //           width: double.infinity,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(viewmodel.errormssage!, style: Theme
    //                   .of(context)
    //                   .textTheme
    //                   .headlineMedium,),
    //               ElevatedButton(onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //               }, child: Text("Try again",style: Theme.of(context).textTheme.labelSmall,))
    //             ],
    //           ),
    //         );
    //       }
    //       return DefaultTabController(
    //               length: viewmodel.articles.length,
    //               child: Column(
    //                 children: [
    //                   TabBar(
    //                     labelStyle: Theme.of(
    //                       context,
    //                     ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
    //                     unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium
    //                         ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
    //                     dividerHeight: 0,
    //                     tabAlignment: TabAlignment.start,
    //                     isScrollable: true,
    //                     tabs: viewmodel.articles.map((source) => Tab(text: source.name)).toList(),
    //                   ),
    //                   Expanded(
    //                     child: TabBarView(
    //                       physics: NeverScrollableScrollPhysics(),
    //                       children: viewmodel.articles
    //                           .map(
    //                             (source) => Padding(
    //                               padding: REdgeInsets.all(16),
    //                               child: ArticlesList(articleId: source.id ?? "",),
    //                             ),
    //                           )
    //                           .toList(),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //     },),
    // );

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
