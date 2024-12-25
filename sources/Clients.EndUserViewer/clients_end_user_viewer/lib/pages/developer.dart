import 'package:flutter/material.dart';
import 'package:nyala/components/layout/button_layout.dart';
import 'package:nyala/components/layout/main_menu.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class DeveloperPage extends StatelessWidget {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();

  DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: MainMenu(contextName: 'Developer Page'),
            body: Center(
                child: ElevatedButton(
              onPressed: () async {
                _httpFormStorage.reset();
              },
              style: ButtonLayout.getDefault(),
              child: Text('Reset http form'),
            ))));
  }
}
