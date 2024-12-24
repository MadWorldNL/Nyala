import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpBodyInput extends StatefulWidget {
  const HttpBodyInput({super.key});

  @override
  HttpBodyInputState createState() => HttpBodyInputState();
}

class HttpBodyInputState extends State<HttpBodyInput> {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? response;

  HttpBodyInputState() {
    init();
  }

  void init() async {
    var body = await _httpFormStorage.getBody();
    response = body;
    controller.text = body;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              scrollController: _scrollController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 10,
              onChanged: (value) => {
                response = value,
                controller.text = value,
                _httpFormStorage.saveBody(value),
              },
              decoration: InputDecoration(
                labelText: 'Body',
                hintText: 'Enter body or past text',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            )));
  }
}