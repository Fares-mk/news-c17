import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/core/resources/strings_manager.dart';

import 'package:news_c17/ui/articles/screen/articles_screen.dart';
import 'package:news_c17/ui/articles/widget/articles_list.dart';
import 'package:news_c17/ui/categories/screen/categories_screen.dart';
import 'package:news_c17/ui/home/widgets/home_drawer.dart';
import 'package:news_c17/ui/home/widgets/search_text_field.dart';

import '../../../data/model/article_response/Article.dart';
import '../../../data/model/category_model.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  bool isSearching=false;
  late TextEditingController searchController;
  List<Article> filteredList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78.h,
        title: isSearching?SearchTextField(onClick: searchAppear,searchController: searchController,onChanged: (value) => setState(() {
          Timer(Duration(milliseconds: 500), () => search(),);
        }),):Text(selectedCategory!=null?selectedCategory!.title:StringsManager.home),
        actions: [
         if(!isSearching)
          IconButton(onPressed:(){
            setState(() {
              isSearching=!isSearching;
            });
          }, icon: Icon(Icons.search))
        ],
      ),
      drawer: isSearching?null:HomeDrawer(goToHome),
      body: searchController.text.isNotEmpty?ArticlesList(filteredList: filteredList,):(selectedCategory!=null
          ?ArticlesScreen(selectedCategory!)
          :CategoriesScreen(onCategoryClick))
    );
  }

  onCategoryClick(CategoryModel newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }

  goToHome(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
  searchAppear(){
     setState(() {
       isSearching=!isSearching;
       searchController.text="";
       filteredList.clear();
     });
  }
   Future<void> search()async{
    filteredList=[];
    var response=await ApiManager.getSearch(searchController.text);
    filteredList=response!.articles!;
    setState(() {

    });
  }
}
