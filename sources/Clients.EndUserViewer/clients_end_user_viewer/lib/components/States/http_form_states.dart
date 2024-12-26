import 'package:flutter/material.dart';
import 'package:nyala/components/inputs/http_params_input.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_request.dart';
import 'package:nyala/functions/https/http_form_storage.dart';
import 'package:nyala/functions/mappers/flatter.dart';

class HttpFormStates {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final httpUrlKey = GlobalKey<UrlInputState>();
  final HttpParamsKey = GlobalKey<HttpParamsInputState>();
  final httpResponseKey = GlobalKey<HttpResponseInputState>();

  Future<HttpRequest> createRequest() async {
    return HttpRequest(
        url: await _httpFormStorage.getUrl(),
        methode: await _httpFormStorage.getMethod(),
        bodyType: HttpBodyTypes.json,
        headers: Flatter.flatten(await _httpFormStorage.getHeaders()),
        body: await _httpFormStorage.getBody());
  }
}
