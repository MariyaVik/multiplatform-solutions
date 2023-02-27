import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' as io;

class WebLink extends StatelessWidget {
  WebLink({required this.link, super.key});
  final String link;

  final bool isMobile = io.Platform.operatingSystem == 'android' ||
      io.Platform.operatingSystem == 'ios';

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? WebViewWidget(
            controller: WebViewController()
              ..clearCache()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(link)))
        : Center(
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Для открытия сайта ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  style: const TextStyle(color: Colors.blue),
                  text: 'Нажтиме сюда',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await launchUrl(Uri.parse(link));
                    }),
            ])),
          );
  }
}
