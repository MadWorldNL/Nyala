import 'package:nyala/domain/https/http_methodes.dart';
import 'package:http/http.dart' as http;

class HttpRequestSender {
  Future<String> sendRequest(HttpMethodes methode, String url) async {
    var response = await http.get(Uri.parse(url));

    switch (methode) {
      case HttpMethodes.get:
        response = await http.get(Uri.parse(url));
        break;
      case HttpMethodes.post:
        response = await http.post(Uri.parse(url));
        break;
      case HttpMethodes.put:
        response = await http.put(Uri.parse(url));
        break;
      case HttpMethodes.delete:
        response = await http.delete(Uri.parse(url));
        break;
      case HttpMethodes.patch:
        response = await http.patch(Uri.parse(url));
        break;
      case HttpMethodes.head:
        response = await http.head(Uri.parse(url));
        break;
      case HttpMethodes.options:
      case HttpMethodes.trace:
        break;
    }

    if (response.statusCode == 200)
    {
      return response.body;
    }
    else
    {
      throw Exception('Failed to load data');
    }
  }
}