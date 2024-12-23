import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/inputs/http_body_input.dart';
import 'package:nyala/components/inputs/http_headers_input.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_request.dart';

class HttpFormStates {
  final httpMethodesKey = GlobalKey<HttpMethodesDropdownState>();
  final httpHeadersKey = GlobalKey<HttpHeadersInputState>();
  final httpBodyKey = GlobalKey<HttpBodyInputState>();
  final httpResponseKey = GlobalKey<HttpResponseInputState>();
  final urlKey = GlobalKey<UrlInputState>();

  HttpRequest createRequest() {
    var selectedMethode = httpMethodesKey.currentState!.selectedType!;
    var url = urlKey.currentState!.controller.text;
    var body = httpBodyKey.currentState!.controller.text;

    return HttpRequest(
        url: url,
        methode: selectedMethode,
        headers: createHeaders(),
        body: body,
        bodyType: HttpBodyTypes.json);
  }

  Map<String, String> createHeaders(){
    var headers = <String, String>{};

    for (var header in httpHeadersKey.currentState!.headers) {
      headers[header['Key']!] = header['Value']!;
    }

    return headers;
  }
}
