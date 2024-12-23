import 'package:nyala/domain/https/http_methodes.dart';
import 'package:nyala/domain/https/http_request.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nyala/functions/formatters/formatter_factory.dart';
import 'package:nyala/functions/https/http_content_type_converter.dart';

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
    var headers = request.headers;
    var contentType = HttpContentTypeConverter.getContentType(request.bodyType);

    if (!headers.containsKey('content-type') && contentType.isNotEmpty) {
      headers['content-type'] = contentType;
    }

    return headers;
  }

  String formatBody(Response? response) {
    if (response == null) {
      return '';
    }

    var contentType = getContentType(response);
    var bodyType = HttpContentTypeConverter.getBodyType(contentType);
    var formatter = FormatterFactory.getFormatter(bodyType);
    return formatter.format(response.body);
  }

  String getContentType(Response response)
  {
    if (response.headers.containsKey('content-type')) {
      return response.headers['content-type']!;
    }

    return '';
  }
}
