import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../models/NewsResponce.dart';

class WebViewScreen extends StatefulWidget {
static const String routeName = 'web';

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    Articles news = ModalRoute.of(context)?.settings.arguments as Articles;
    return  Container(
        decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/background.png',)
    )
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    title: Text('News App'),
    ),
      body:  WebView(
        initialUrl: news.url,
      )
    )
    );
  }
}
