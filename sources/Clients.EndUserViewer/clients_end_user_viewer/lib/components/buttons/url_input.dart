import 'package:flutter/material.dart';

class UrlInput extends StatefulWidget {
  const UrlInput({super.key});

  @override
  UrlInputState createState() => UrlInputState();
}

class UrlInputState extends State<UrlInput> {
  String? url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextField(
      decoration: InputDecoration(
        labelText: 'Url',
        hintText: 'Enter URL or past text', 
        border: OutlineInputBorder(),
      ),
    ));
  }
}
