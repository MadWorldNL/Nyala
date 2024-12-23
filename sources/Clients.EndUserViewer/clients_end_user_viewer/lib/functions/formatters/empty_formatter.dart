import 'package:nyala/domain/formatters/string_formatter.dart';

class EmptyFormatter implements StringFormatter {
  @override
  String format(String value) {
    return value;
  }
}