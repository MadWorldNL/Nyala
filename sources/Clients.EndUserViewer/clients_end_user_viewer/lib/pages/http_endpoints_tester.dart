import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/buttons/http_send_request_button.dart';
import 'package:nyala/components/inputs/http_body_input.dart';
import 'package:nyala/components/inputs/http_headers_input.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/components/layout/main_menu.dart';
import 'package:nyala/components/states/http_form_states.dart';

class HttpEndpointsTester extends StatelessWidget {
  final HttpFormStates _httpFormStates = HttpFormStates();

  HttpEndpointsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            initialIndex: 3,
            length: 5,
            child: Scaffold(
              appBar: MainMenu(contextName: 'Http Page'),
              body: Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        HttpMethodesDropdown(key: _httpFormStates.httpMethodesKey),
                        UrlInput(key: _httpFormStates.urlKey),
                        SendRequestButton(states: _httpFormStates),
                      ]),
                      SizedBox(height: 20), // Add some spacing
                      TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "Params"),
                          Tab(text: "Authorizantion"),
                          Tab(text: "Headers"),
                          Tab(text: "Body"),
                          Tab(text: "Settings"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Text('Params'),
                            Text("Authorizantion"),
                            HttpHeadersInput(),
                            HttpBodyInput(),
                            Text('Settings'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          HttpResponseInput(key: _httpFormStates.httpResponseKey),
                        ],
                      )
                    ]),
              ),
            )));
  }
}
