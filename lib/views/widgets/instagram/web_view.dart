 import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class WebViewExample extends StatefulWidget {
   @override
   WebViewExampleState createState() => WebViewExampleState();
 }

 class WebViewExampleState extends State<WebViewExample> {
   @override
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return WebView(
       initialUrl: 'https://www.google.com',
      //  onProgress: (int progress) {
      //       print('WebView is loading (progress : $progress%)');
      //     },
      //     onPageStarted: (String url) {
      //       print('Page started loading: https://www.instagram.com');
      //     },
      //     onPageFinished: (String url) {
      //       print('Page finished loading: https://www.instagram.com');
      //     },
     );
   }
 }