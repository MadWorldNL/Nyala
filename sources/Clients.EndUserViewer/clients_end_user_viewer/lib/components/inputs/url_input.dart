import 'package:flutter/material.dart';
import 'package:nyala/components/inputs/http_params_input.dart';
import 'package:nyala/functions/https/http_form_storage.dart';
import 'package:nyala/functions/mappers/flatter.dart';

class UrlInput extends StatefulWidget {
  final GlobalKey<HttpParamsInputState> httpParamsKey;
  const UrlInput({super.key, required this.httpParamsKey});

  @override
  UrlInputState createState() => UrlInputState();
}

class UrlInputState extends State<UrlInput> {
  static const String keyName = 'Key';
  static const String valueName = 'Value';

  late final GlobalKey<HttpParamsInputState> httpParamsKey;
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final TextEditingController controller = TextEditingController();
  String? url;

  bool hasError = false;

  @override
  void initState() {
    super.initState();
    httpParamsKey = widget.httpParamsKey;
    loadUrl();
  }

  void loadUrl() async {
    var savedUrl = await _httpFormStorage.getUrl();
    url = savedUrl;
    controller.text = savedUrl;

    try {
      Uri.parse(savedUrl);
    } catch (e) {
      setError(true);
    }
  }

  void updateUrl(Map<String, String> params) {
    var url = controller.text;

    try {
      final uri = Uri.parse(url);
      final updatedUri = uri.replace(
        queryParameters: {
          for (int i = 0; i < params.length; i++)
            params.keys.elementAt(i): params.values.elementAt(i),
        },
      );

      controller.text = updatedUri.toString();
      _httpFormStorage.saveUrl(updatedUri.toString());

      setError(false);
    } catch (e) {
      setError(true);
    }
  }

  void _updateText(String value) {
    url = value;
    _httpFormStorage.saveUrl(value);

    try {
      final uri = Uri.parse(value);

      if (httpParamsKey.currentState != null) {
        httpParamsKey.currentState!.updateParams(uri.queryParameters);
      }
      _httpFormStorage.saveParams(Flatter.unflatten(uri.queryParameters));

      setError(false);
    } catch (e) {
      setError(true);
    }
  }

  void setError(bool error) {
    setState(() {
      hasError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (value) => _updateText(value),
              decoration: InputDecoration(
                labelText: 'Url',
                hintText: 'Enter URL or past text',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: hasError ? Colors.red[100] : Colors.white,
              ),
            )));
  }
}
