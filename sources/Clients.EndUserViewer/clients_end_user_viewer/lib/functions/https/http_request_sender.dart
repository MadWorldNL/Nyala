import 'dart:convert';

import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_body_raw_types.dart';
import 'package:nyala/domain/https/http_methodes.dart';
import 'package:nyala/domain/https/http_request.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpRequestSender {
  Future<String> sendRequest(HttpRequest request) async {
    Response? response;

    var headers = createHeaders(request);

    var url = Uri.parse(request.url);
    switch (request.methode) {
      case HttpMethodes.get:
        response = await http.get(url);
        break;
      case HttpMethodes.post:
        response = await http.post(url, headers: headers, body: request.body);
        break;
      case HttpMethodes.put:
        response = await http.put(url, headers: headers, body: request.body);
        break;
      case HttpMethodes.delete:
        response = await http.delete(url, headers: headers, body: request.body);
        break;
      case HttpMethodes.patch:
        response = await http.patch(url, headers: headers, body: request.body);
        break;
      case HttpMethodes.head:
        response = await http.head(url);
        break;
      case HttpMethodes.options:
      case HttpMethodes.trace:
        break;
    }

    return formatBody(response);
  }

  Map<String, String> createHeaders(HttpRequest request) {
    var headers = <String, String>{};

    var contentType = getContentType(request);

    if (contentType.isNotEmpty) {
      headers['content-type'] = contentType;
    }

    return headers;
  }

  String getContentType(HttpRequest request) {
    switch (request.bodyType) {
      case HttpBodyTypes.none:
        return '';
      case HttpBodyTypes.raw:
        return getRawContentType(request);
      case HttpBodyTypes.formData:
        return 'multipart/form-data';
      case HttpBodyTypes.xWwwFormUrlencoded:
        return 'application/x-www-form-urlencoded';
      case HttpBodyTypes.binary:
        return 'application/octet-stream';
    }
  }

  String getRawContentType(HttpRequest request) {
    switch (request.rawType) {
      case HttpBodyRawTypes.none:
        return '';
      case HttpBodyRawTypes.json:
        return 'application/json';
      case HttpBodyRawTypes.xml:
        return 'application/xml';
      case HttpBodyRawTypes.html:
        return 'text/html';
      case HttpBodyRawTypes.javascript:
        return 'application/javascript';
      case HttpBodyRawTypes.text:
        return 'text/plain';
    }
  }

  String formatBody(Response? response) {
    if (response == null) {
      return '';
    }

    if (isJson(response)) {
      return formatJsonBody(response.body);
    }

    return response.body;
  }

  bool isJson(Response response) {
    return response.headers.containsKey('content-type') &&
        response.headers['content-type']!.contains('application/json');
  }

  String formatJsonBody(String body) {
    var json = jsonDecode(body);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}
