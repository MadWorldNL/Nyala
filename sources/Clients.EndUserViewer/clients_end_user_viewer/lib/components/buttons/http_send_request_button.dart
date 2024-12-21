import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/inputs/url_input.dart';

class SendRequestButton extends StatelessWidget {
  final GlobalKey<HttpMethodesDropdownState> httpMethodesKey;
  final GlobalKey<UrlInputState> urlKey;

  const SendRequestButton({super.key, required this.httpMethodesKey, required this.urlKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Input text: ${httpMethodesKey.currentState!.selectedType!.name} ${urlKey.currentState!.controller.text}');
      },
      child: Text('Send'),
    );
  }
}
