import 'package:flutter/material.dart';
import 'package:nyala/components/layout/button_layout.dart';
import 'package:nyala/components/states/http_form_states.dart';
import 'package:nyala/functions/https/http_request_sender.dart';

class SendRequestButton extends StatelessWidget {
  final HttpFormStates states;
  final HttpRequestSender httpRequestSender = HttpRequestSender();

  SendRequestButton({super.key, required this.states});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            await sendRequest();
          },
          style: ButtonLayout.getDefault(),
          child: Text('Send'),
        ));
  }

  Future<void> sendRequest() async {
    var request = await states.createRequest();
    var response = await httpRequestSender.sendRequest(request);
    
    states.httpResponseKey.currentState!.controller.text = response;
  }
}
