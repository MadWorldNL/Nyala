import 'package:nyala/domain/https/http_methodes.dart';

class HttpRequest {
  final String url;
  final HttpMethodes methode;
  final String body;

  HttpRequest({required this.url, required this.methode, required this.body});
}