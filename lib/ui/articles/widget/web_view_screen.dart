import 'package:flutter/material.dart';
import 'package:news_c17/core/resources/routes_manager.dart';
import 'package:news_c17/ui/home/screen/home_screen.dart';
import 'package:news_c17/ui/home/widgets/home_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/model/category_model.dart';


class WebViewScreen extends StatefulWidget {
  final String url;
  CategoryModel? selectedCategory;

  WebViewScreen({required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article")),
      drawer: HomeDrawer(goToHome),
      body: WebViewWidget(controller: controller),
    );
  }

  goToHome() {
    widget.selectedCategory = null;
    Navigator.pushNamed(context, RoutesManager.home);
    setState(() {});
  }
}
