import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/buttons/http_send_request_button.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/components/layout/main_menu.dart';

class HttpEndpointsTester extends StatelessWidget {
  final httpMethodesKey = GlobalKey<HttpMethodesDropdownState>();
  final urlKey = GlobalKey<UrlInputState>();

  HttpEndpointsTester({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: MainMenu(contextName: 'Http Page'),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [HttpMethodesDropdown(key: httpMethodesKey), UrlInput(key: urlKey), SendRequestButton(httpMethodesKey: httpMethodesKey, urlKey: urlKey)],
        ),
      ),
    ));
  }
}
