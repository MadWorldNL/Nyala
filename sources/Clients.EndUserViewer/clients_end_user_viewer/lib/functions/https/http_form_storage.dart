import 'dart:convert';

import 'package:nyala/domain/https/http_methodes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpFormStorage {
  final String _bodyKey = 'body';
  final String _headersKey = 'headers';
  final String _urlKey = 'url';

  void reset() async {
    final storage = await SharedPreferences.getInstance();
    storage.remove(_bodyKey);
    storage.remove(_headersKey);
  }

  Future<String> getBody() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_bodyKey) ?? '';
  }

  Future<List<Map<String, String>>> getHeaders() async {
    final storage = await SharedPreferences.getInstance();
    var headers = storage.getString(_headersKey);

    if (headers != null) {
      return List<Map<String, String>>.from(
        jsonDecode(headers).map((e) => Map<String, String>.from(e))
      );
    }

    return [];
  }

  Future<HttpMethodes> getMethod() async {
    final storage = await SharedPreferences.getInstance();
    return HttpMethodes.values[storage.getInt('method') ?? 0];
  }

    Future<String> getUrl() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_urlKey) ?? '';
  }

  void saveBody(String body) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_bodyKey, body);
  }

  void saveHeaders(List<Map<String, String>> headers) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_headersKey, jsonEncode(headers));
  }

  void saveMethod(HttpMethodes method) async {
    final storage = await SharedPreferences.getInstance();
    storage.setInt('method', method.index);
  }

  void saveUrl(String url) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_urlKey, url);
  }
}