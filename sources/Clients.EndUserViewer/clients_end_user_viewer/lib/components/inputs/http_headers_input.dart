import 'package:flutter/material.dart';

class HttpHeadersInput extends StatefulWidget {
  const HttpHeadersInput({super.key});

  @override
  HttpHeadersInputState createState() => HttpHeadersInputState();
}

class HttpHeadersInputState extends State<HttpHeadersInput> {
  final List<Map<String, String>> headers = [{}];

  void _addRow() {
    setState(() {
      headers.add({});
    });
  }

  void _updateCell(int rowIndex, String columnKey, String value) {
    setState(() {
      headers[rowIndex][columnKey] = value;
    });
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
