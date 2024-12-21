import 'package:flutter/material.dart';
import 'package:nyala/components/main_menu.dart';

class HttpEndpointsTester extends StatelessWidget {
  const HttpEndpointsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainMenu(contextName: 'Http Page'),
        body: Center(
          child: Text('Hello World!'),
        )
      ),
    );
  }
}
