import 'package:flutter/material.dart';
import 'package:nyala/components/states/http_form_states.dart';
import 'package:nyala/functions/https/http_request_sender.dart';

class SendRequestButton extends StatelessWidget {
  final HttpRequestSender httpRequestSender = HttpRequestSender();

  final HttpFormStates httpFormStates;

  SendRequestButton({super.key, required this.httpFormStates});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            await sendRequest();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button background color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 5, // Shadow effect
          ),
          child: Text('Send'),
        ));
  }

  Future<void> sendRequest() async {
    var request = httpFormStates.createRequest();
    var response = await httpRequestSender.sendRequest(request);

    httpFormStates.httpResponseKey.currentState!.controller.text = response;
  }
}
