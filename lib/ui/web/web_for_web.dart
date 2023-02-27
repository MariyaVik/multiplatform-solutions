import 'dart:math';
import 'dart:ui' as ui;
import 'dart:html';

import 'package:flutter/material.dart';

class WebLink extends StatelessWidget {
  const WebLink({required this.link, Key? key}) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(id, (int viewId) => IFrameElement()..src = link);
    return HtmlElementView(viewType: id);
  }
}
