import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebLink extends StatelessWidget {
  const WebLink({required this.link, super.key});
  final String link;

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
        controller: WebViewController()
          ..clearCache()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(link)));
  }
}
