import 'dart:convert';

import 'package:nyala/domain/formatters/string_formatter.dart';

class JsonFormatter implements StringFormatter {
  @override
  String format(String value) {
    var json = jsonDecode(value);
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}