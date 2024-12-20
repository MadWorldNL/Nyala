import 'package:flutter/material.dart';
import 'package:nyala/components/main_menu.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainMenu(contextName: 'Contact Page'),
        body: Center(
          child: Text('Best regards!'),
        )
      ),
    );
  }
}
