import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class UrlInput extends StatefulWidget {
  const UrlInput({super.key});

  @override
  UrlInputState createState() => UrlInputState();
}

class UrlInputState extends State<UrlInput> {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final TextEditingController controller = TextEditingController();
  String? url;

  UrlInputState() {
    init();
  }

  void init() async {
    var savedUrl = await _httpFormStorage.getUrl();
    url = savedUrl;
    controller.text = savedUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (value) =>
                  {url = value, _httpFormStorage.saveUrl(value)},
              decoration: InputDecoration(
                labelText: 'Url',
                hintText: 'Enter URL or past text',
                border: OutlineInputBorder(),
              ),
            )));
  }
}
