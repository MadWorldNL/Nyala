import 'dart:convert';

import 'package:nyala/domain/https/http_methodes.dart';
import 'package:nyala/domain/https/http_request.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpRequestSender {
  Future<String> sendRequest(HttpRequest request) async {
    Response? response;

    var headers = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(request.url);
    switch (request.methode) {
      case HttpMethodes.get:
        response = await http.get(url);
        break;
      case HttpMethodes.post:
        response = await http.post(url, headers: headers, body: request.body);
        break;
      case HttpMethodes.put:
        response = await http.put(url, headers: headers,  body: request.body);
        break;
      case HttpMethodes.delete:
        response = await http.delete(url, headers: headers,  body: request.body);
        break;
      case HttpMethodes.patch:
        response = await http.patch(url, headers: headers,  body: request.body);
        break;
      case HttpMethodes.head:
        response = await http.head(url);
        break;
      case HttpMethodes.options:
      case HttpMethodes.trace:
        break;
    }

    if (response == null) 
    {
      return '';
    }

    if (response.headers.containsKey('content-type') && response.headers['content-type']!.contains('application/json'))
    {
      return formatJsonBody(response.body);
    }

    return response.body;
  }

  String formatJsonBody(String body) {
    var json = jsonDecode(body);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}