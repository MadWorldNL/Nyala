import 'package:flutter/material.dart';
import 'package:nyala/components/main_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainMenu(contextName: 'Hello world!'),
        body: Center(
          child: Text('Main Menu Content'),
        ),
      ),
    );
  }
}
