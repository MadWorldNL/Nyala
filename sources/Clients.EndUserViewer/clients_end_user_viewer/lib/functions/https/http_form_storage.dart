import 'dart:convert';

import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_methodes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpFormStorage {
  final String _bodyKey = 'body';
  final String _bodyTypeKey = 'bodyType';
  final String _headersKey = 'headers';
  final String _methodKey = 'method';
  final String _paramsKey = 'params';
  final String _urlKey = 'url';

  void reset() async {
    final storage = await SharedPreferences.getInstance();
    storage.remove(_bodyKey);
    storage.remove(_bodyTypeKey);
    storage.remove(_headersKey);
    storage.remove(_methodKey);
    storage.remove(_paramsKey);
    storage.remove(_urlKey);
  }

  Future<String> getBody() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_bodyKey) ?? '';
  }

  Future<HttpBodyTypes> getBodyType() async {
    final storage = await SharedPreferences.getInstance();
    return HttpBodyTypes.values[storage.getInt(_bodyTypeKey) ?? 0];
  }

  Future<List<Map<String, String>>> getHeaders() async {
    return _retrieveListMap(_headersKey);
  }

  Future<HttpMethodes> getMethod() async {
    final storage = await SharedPreferences.getInstance();
    return HttpMethodes.values[storage.getInt(_methodKey) ?? 0];
  }

  Future<List<Map<String, String>>> getParams() async {
    return _retrieveListMap(_paramsKey);
  }

  Future<String> getUrl() async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(_urlKey) ?? '';
  }

  Future<List<Map<String, String>>> _retrieveListMap(String key) async {
    final storage = await SharedPreferences.getInstance();
    var listMap = storage.getString(key);

    if (listMap != null) {
      return List<Map<String, String>>.from(
        jsonDecode(listMap).map((e) => Map<String, String>.from(e))
      );
    }

    return [];
  }

  void saveBody(String body) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_bodyKey, body);
  }

  void saveBodyType(HttpBodyTypes type) async {
    final storage = await SharedPreferences.getInstance();
    storage.setInt(_bodyTypeKey, type.index);
  }

  void saveHeaders(List<Map<String, String>> headers) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_headersKey, jsonEncode(headers));
  }

  void saveMethod(HttpMethodes method) async {
    final storage = await SharedPreferences.getInstance();
    storage.setInt(_methodKey, method.index);
  }

  void saveParams(List<Map<String, String>> params) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_paramsKey, jsonEncode(params));
  }

  void saveUrl(String url) async {
    final storage = await SharedPreferences.getInstance();
    storage.setString(_urlKey, url);
  }
}