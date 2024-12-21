import 'package:flutter/material.dart';
import 'package:nyala/components/layout/main_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainMenu(contextName: 'Home Page'),
        body: Center(
          child: Text('Hello World!'),
        )
      ),
    );
  }
}
