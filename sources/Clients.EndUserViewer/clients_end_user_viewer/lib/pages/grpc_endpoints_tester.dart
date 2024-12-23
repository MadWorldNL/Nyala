import 'package:flutter/material.dart';
import 'package:nyala/components/layout/main_menu.dart';

class GrpcEndpointsTester extends StatelessWidget {
  const GrpcEndpointsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainMenu(contextName: 'Grpc Page'),
        body: Center(
          child: Text('Hello World!'),
        )
      ),
    );
  }
}
