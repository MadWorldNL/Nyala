import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpHeadersInput extends StatefulWidget {
  const HttpHeadersInput({super.key});

  @override
  HttpHeadersInputState createState() => HttpHeadersInputState();
}

class HttpHeadersInputState extends State<HttpHeadersInput> {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final List<Map<String, String>> headers = [{}];

  HttpHeadersInputState() {
    init();
  }

  void init() async {
    var savedHeaders = await _httpFormStorage.getHeaders();
        setState(() {
    headers.clear();
    headers.addAll(savedHeaders);
        });
  }

  void _addRow() async {
    setState(() {
      headers.add({});
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
                          decoration: const InputDecoration(
                            labelText: 'Key',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) =>
                              _updateCell(index, 'Key', value),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Value',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) =>
                              _updateCell(index, 'Value', value),
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
