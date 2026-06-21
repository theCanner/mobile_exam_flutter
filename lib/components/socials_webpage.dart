import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SocialsWebpage extends StatefulWidget {
  const SocialsWebpage({super.key, required this.url});

  final String url;

  @override
  State<SocialsWebpage> createState() => SocialsWebpageState();
}

class SocialsWebpageState extends State<SocialsWebpage> {
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
    return WebViewWidget(controller: controller);
  }
}
