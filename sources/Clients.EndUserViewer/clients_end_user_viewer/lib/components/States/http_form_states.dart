import 'package:flutter/material.dart';
import 'package:nyala/components/buttons/http_dropdown.dart';
import 'package:nyala/components/inputs/http_response_input.dart';
import 'package:nyala/components/inputs/url_input.dart';

class HttpFormStates {
  final httpMethodesKey = GlobalKey<HttpMethodesDropdownState>();
  final httpResponseKey = GlobalKey<HttpResponseInputState>();
  final urlKey = GlobalKey<UrlInputState>();
}