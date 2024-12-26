import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpParamsInput extends StatefulWidget {
  const HttpParamsInput({super.key});

  @override
  HttpParamsInputState createState() => HttpParamsInputState();
}

class HttpParamsInputState extends State<HttpParamsInput> {
  static const String keyName = 'Key';
  static const String valueName = 'Value';

  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final List<Map<String, String>> params = [];
  final List<TextEditingController> keyControllers = [];
  final List<TextEditingController> valueControllers = [];

  @override
  void initState() {
    super.initState();
    _loaderHeaders();
  }

  void _loaderHeaders() async {
    var savedParams = await _httpFormStorage.getParams();
    setState(() {
      params.clear();
      keyControllers.clear();
      valueControllers.clear();

      params.addAll(savedParams);
      for (var header in savedParams) {
        keyControllers.add(TextEditingController(text: header[keyName] ?? ''));
        valueControllers.add(TextEditingController(text: header[valueName] ?? ''));
      }
    });
  }

  void _addRow() async {
    setState(() {
      params.add({keyName: '', valueName: ''});
      keyControllers.add(TextEditingController());
      valueControllers.add(TextEditingController());
    });

    _httpFormStorage.saveParams(params);
  }

  void _removeRowWhenEmpty(int rowIndex) {
    if (params[rowIndex][keyName]!.isEmpty && params[rowIndex][valueName]!.isEmpty) {
      _removeRow(rowIndex);
    }
  }

  void _removeRow(int rowIndex) async {
    setState(() {
      params.removeAt(rowIndex);
      keyControllers.removeAt(rowIndex);
      valueControllers.removeAt(rowIndex);
    });

    _httpFormStorage.saveParams(params);
  }

  void _updateCell(int rowIndex, String columnKey, String value) {
    setState(() {
      params[rowIndex][columnKey] = value;
    });

    _removeRowWhenEmpty(rowIndex);  
    _httpFormStorage.saveParams(params);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: params.length,
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
