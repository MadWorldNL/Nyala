import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/functions/https/http_request_sender.dart';

class SendRequestButton extends StatelessWidget {
  final HttpRequestSender httpRequestSender = HttpRequestSender();

  final GlobalKey<HttpMethodesDropdownState> httpMethodesKey;
  final GlobalKey<UrlInputState> urlKey;

  SendRequestButton({super.key, required this.httpMethodesKey, required this.urlKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var response = await httpRequestSender.sendRequest(httpMethodesKey.currentState!.selectedType!, urlKey.currentState!.controller.text);
        print('Input text: ${response}');
      },
      child: Text('Send'),
    );
  }
}
