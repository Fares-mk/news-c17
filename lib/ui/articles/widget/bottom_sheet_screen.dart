import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/resources/strings_manager.dart';
import 'package:news_c17/model/article_response/Article.dart';
import 'package:news_c17/ui/articles/widget/web_view_screen.dart';

class BottomSheetScreen extends StatelessWidget {
  Article article;
  BottomSheetScreen({required this.article});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  fit: BoxFit.cover,
                  height: 220,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error_outline_outlined, size: 40.sp),
                ),
            ),
            Text(article.description??""),
            ElevatedButton(
              onPressed: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: article.url??""),)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              child: Center(child: Text(StringsManager.ViewFullArticel)),
            ),

          ],
        ),
      ),
    );
  }
}
