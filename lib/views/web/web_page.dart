import 'package:flutter/material.dart';
import 'package:wanandroid/widget/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final Map? arguments;

  WebViewPage({Key? key, this.arguments}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState(arguments: arguments);
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  Map? arguments;
  String? title = "网页";
  _WebViewPageState({this.arguments});

  @override
  void initState() {

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (request) {
            print("url---->" + request.url);
            return NavigationDecision.navigate;
          },
          onPageFinished: (url) async {
            title = await controller.getTitle();
            setState(() {
              title = title;
            });
          }))
    ..loadRequest(Uri.parse(arguments!["url"]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title!),
      body: Center(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
