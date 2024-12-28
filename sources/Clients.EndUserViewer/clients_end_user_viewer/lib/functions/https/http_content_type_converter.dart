import 'package:nyala/domain/https/http_body_types.dart';

class HttpContentTypeConverter {
  static String getContentType(HttpBodyTypes bodyType) {
    switch (bodyType) {
      case HttpBodyTypes.none:
        return '';
      case HttpBodyTypes.formData:
        return 'multipart/form-data';
      case HttpBodyTypes.xWwwFormUrlencoded:
        return 'application/x-www-form-urlencoded';
      case HttpBodyTypes.binary:
        return 'application/octet-stream';
      case HttpBodyTypes.json:
        return 'application/json';
      case HttpBodyTypes.xml:
        return 'application/xml';
      case HttpBodyTypes.html:
        return 'text/html';
      case HttpBodyTypes.javascript:
        return 'application/javascript';
      case HttpBodyTypes.text:
        return 'text/plain';
    }
  }

  static HttpBodyTypes getBodyType(String bodyType) {
    bodyType = bodyType.toLowerCase();

    if (bodyType.isEmpty) {
      return HttpBodyTypes.none;
    } else if (bodyType.contains('multipart/form-data')) {
      return HttpBodyTypes.formData;
    } else if (bodyType.contains('application/x-www-form-urlencoded')) {
      return HttpBodyTypes.xWwwFormUrlencoded;
    } else if (bodyType.contains('application/octet-stream')) {
      return HttpBodyTypes.binary;
    } else if (bodyType.contains('application/json')) {
      return HttpBodyTypes.json;
    } else if (bodyType.contains('application/xml')) {
      return HttpBodyTypes.xml;
    } else if (bodyType.contains('text/html')) {
      return HttpBodyTypes.html;
    } else if (bodyType.contains('application/javascript')) {
      return HttpBodyTypes.javascript;
    } else if (bodyType.contains('text/plain')) {
      return HttpBodyTypes.text;
    } else {
      return HttpBodyTypes.none;
    }
  }
}
