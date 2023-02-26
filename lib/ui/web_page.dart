import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skillbox_16_6/data/load_web.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final webService = WebService();

  String text = '';
  String titile = '';
  String cors = '';
  String os = kIsWeb ? 'WEB' : Platform.operatingSystem;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  titile,
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
                Text(
                  cors == '' ? '' : 'CORS header: $cors',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
                Text(text),
              ],
            ),
          ),
        ),
        ColoredBox(
          color: Colors.black12,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: controller,
                          // initialValue: 'https://flutter.dev/',
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () async {
                            webService.url = controller.text;
                            text = await webService.getWebBody();
                            titile = await webService.getWebTitle();
                            cors = await webService.getWebCORS();
                            setState(() {});
                          },
                          child: Text('Открыть')))
                ],
              ),
              Center(
                child: Text('Приложение запущено на ОС $os'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// class WebLink extends StatelessWidget {
//   const WebLink({required this.link, Key? key}) : super(key: key);
//   final String link;

//   @override
//   Widget build(BuildContext context) {
//     final id = Random().nextInt.toString();
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry
//         .registerViewFactory(id, (int viewId) => IFrameElement()..src = link);
//     return HtmlElementView(viewType: id);
//   }
// }
