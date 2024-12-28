import 'package:flutter/material.dart';
import 'package:nyala/components/inputs/url_input.dart';
import 'package:nyala/functions/https/http_form_storage.dart';
import 'package:nyala/functions/mappers/flatter.dart';

class HttpParamsInput extends StatefulWidget {
  final GlobalKey<UrlInputState> httpUrlKey;
  const HttpParamsInput({super.key, required this.httpUrlKey});

  @override
  HttpParamsInputState createState() => HttpParamsInputState();
}

class HttpParamsInputState extends State<HttpParamsInput> {
  static const String keyName = 'Key';
  static const String valueName = 'Value';

  late final GlobalKey<UrlInputState> httpUrlKey;
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final List<Map<String, String>> params = [];
  final List<TextEditingController> keyControllers = [];
  final List<TextEditingController> valueControllers = [];

  @override
  void initState() {
    super.initState();
    httpUrlKey = widget.httpUrlKey;

    _loaderParamsFromStorage();
  }

  void updateParams(Map<String, String> params) {
    var newParams = Flatter.unflatten(params);
    _loaderParams(newParams);
  }

  void _loaderParamsFromStorage() async {
    var newParams = await _httpFormStorage.getParams();
    _loaderParams(newParams);
  }

  void _loaderParams(List<Map<String, String>> newParams) async {
    setState(() {
      params.clear();
      keyControllers.clear();
      valueControllers.clear();

      params.addAll(newParams);
      for (var header in newParams) {
        keyControllers.add(TextEditingController(text: header[keyName] ?? ''));
        valueControllers
            .add(TextEditingController(text: header[valueName] ?? ''));
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
    if (params[rowIndex][keyName]!.isEmpty &&
        params[rowIndex][valueName]!.isEmpty) {
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

    httpUrlKey.currentState!.updateUrl(Flatter.flatten(params));
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
            child: const Text('Add new param'),
          ),
        ),
      ],
    );
  }
}
