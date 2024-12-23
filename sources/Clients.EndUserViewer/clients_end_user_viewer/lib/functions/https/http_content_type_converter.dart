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
    switch (bodyType) {
      case 'multipart/form-data':
        return HttpBodyTypes.formData;
      case 'application/x-www-form-urlencoded':
        return HttpBodyTypes.xWwwFormUrlencoded;
      case 'application/octet-stream':
        return HttpBodyTypes.binary;
      case 'application/json':
        return HttpBodyTypes.json;
      case 'application/xml':
        return HttpBodyTypes.xml;
      case 'text/html':
        return HttpBodyTypes.html;
      case 'application/javascript':
        return HttpBodyTypes.javascript;
      case 'text/plain':
        return HttpBodyTypes.text;
      default:
        return HttpBodyTypes.none;
    }
  }
}