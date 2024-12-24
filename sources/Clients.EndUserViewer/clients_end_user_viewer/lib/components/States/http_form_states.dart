import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_request.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpFormStates {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();

  final httpMethodesKey = GlobalKey<HttpMethodesDropdownState>();
  final httpResponseKey = GlobalKey<HttpResponseInputState>();
  final urlKey = GlobalKey<UrlInputState>();

  Future<HttpRequest> createRequest() async {
    return HttpRequest(
        url: urlKey.currentState!.controller.text,
        methode: httpMethodesKey.currentState!.selectedType!,
        bodyType: HttpBodyTypes.json,
        headers: flatten(await _httpFormStorage.getHeaders()),
        body: await _httpFormStorage.getBody());
  }

  Map<String, String> flatten(List<Map<String, String>> headerForm) {
    var headers = <String, String>{};

    for (var header in headerForm) {
      headers[header['Key']!] = header['Value']!;
    }

    return headers;
  }
}
