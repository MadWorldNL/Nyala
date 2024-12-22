import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/buttons/http_send_request_button.dart';
import 'package:nyala/components/inputs/http_body_input.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/components/layout/main_menu.dart';
import 'package:nyala/components/states/http_form_states.dart';

class HttpEndpointsTester extends StatelessWidget {
  final HttpFormStates states = HttpFormStates();

  HttpEndpointsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: MainMenu(contextName: 'Http Page'),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                HttpMethodesDropdown(key: states.httpMethodesKey),
                UrlInput(key: states.urlKey),
                SendRequestButton(httpFormStates: states)
              ]),
              Row(children: [
                HttpBodyInput(key: states.httpBodyKey),
              ]),
              Row(children: [
                HttpResponseInput(key: states.httpResponseKey),
              ])
            ]),
      ),
    ));
  }
}
