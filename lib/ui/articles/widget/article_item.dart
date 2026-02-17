import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_c17/model/article_response/Article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   showModalBottomSheet(context: context, builder: (context) {
      //     return Text("data");
      //   },);
      // },
      child: Container(
        padding: REdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          spacing: 10,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
            Text(
              article.content ?? "",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? "")),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
