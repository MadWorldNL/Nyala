import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/domain/https/http_methodes.dart';

class HttpRequest {
  final String url;
  final HttpMethodes methode;
  final Map<String, String> headers;
  final HttpBodyTypes bodyType;
  final String body;

  HttpRequest({required this.url, required this.methode, required this.body, required this.headers, required this.bodyType});
}