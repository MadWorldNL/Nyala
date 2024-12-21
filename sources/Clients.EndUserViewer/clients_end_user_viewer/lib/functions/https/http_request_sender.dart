import 'package:nyala/domain/https/http_methodes.dart';
import 'package:http/http.dart' as http;

class HttpRequestSender {
  Future<String> sendRequest(HttpMethodes methode, String url) async {
    var response = await http.get(Uri.parse(url));

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