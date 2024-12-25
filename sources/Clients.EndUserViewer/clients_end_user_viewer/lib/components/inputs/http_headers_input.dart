import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpHeadersInput extends StatefulWidget {
  const HttpHeadersInput({super.key});

  @override
  HttpHeadersInputState createState() => HttpHeadersInputState();
}

class HttpHeadersInputState extends State<HttpHeadersInput> {
  static const String keyName = 'Key';
  static const String valueName = 'Value';

  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final List<Map<String, String>> headers = [];
  final List<TextEditingController> keyControllers = [];
  final List<TextEditingController> valueControllers = [];

  @override
  void initState() {
    super.initState();
    _loaderHeaders();
  }

  void _loaderHeaders() async {
    var savedHeaders = await _httpFormStorage.getHeaders();
    setState(() {
      headers.clear();
      keyControllers.clear();
      valueControllers.clear();

      headers.addAll(savedHeaders);
      for (var header in savedHeaders) {
        keyControllers.add(TextEditingController(text: header[keyName] ?? ''));
        valueControllers.add(TextEditingController(text: header[valueName] ?? ''));
      }
    });
  }

  void _addRow() async {
    setState(() {
      headers.add({});
      keyControllers.add(TextEditingController());
      valueControllers.add(TextEditingController());
    });

    _httpFormStorage.saveHeaders(headers);
  }

  void _updateCell(int rowIndex, String columnKey, String value) {
    setState(() {
      headers[rowIndex][columnKey] = value;
    });

    _httpFormStorage.saveHeaders(headers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: headers.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: keyControllers[index],
                        decoration: const InputDecoration(
                          labelText: keyName,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) =>
                            _updateCell(index, keyName, value),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: valueControllers[index],
                        decoration: const InputDecoration(
                          labelText: valueName,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) =>
                          _updateCell(index, valueName, value),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _addRow,
            child: const Text('Add Row'),
          ),
        ),
      ],
    );
  }
}
