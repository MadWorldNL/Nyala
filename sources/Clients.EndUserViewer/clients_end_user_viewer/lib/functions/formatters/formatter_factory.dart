import 'package:nyala/domain/formatters/string_formatter.dart';
import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/functions/formatters/empty_formatter.dart';
import 'package:nyala/functions/formatters/json_formatter.dart';

class FormatterFactory {
  static StringFormatter getFormatter(HttpBodyTypes type) {
    switch (type){
      case HttpBodyTypes.json:
        return JsonFormatter();
      default:
        return EmptyFormatter();
    }
  }
}