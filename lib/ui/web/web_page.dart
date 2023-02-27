import '../../data/load_web.dart';
import 'web_for_no_web.dart' if (dart.library.html) 'web_for_web.dart';
import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  String os = kIsWeb ? 'WEB' : io.Platform.operatingSystem;

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
          child: Column(
            children: [
              Text(
                titile,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                cors == '' ? '' : 'CORS header: $cors',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              // Text(text),
              if (controller.text != '')
                Expanded(
                  child: WebLink(link: controller.text),
                )
            ],
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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () async {
                            print('нажали');
                            webService.url = controller.text;
                            text = await webService.getWebBody();
                            titile = await webService.getWebTitle();
                            cors = await webService.getWebCORS();

                            print('!!!!!!!!!!!!!!!!!!!!!  ${controller.text}');
                            setState(() {});
                          },
                          child: const Text('Открыть')))
                ],
              ),
              Center(
                child: Text('Приложение запущено на $os'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
