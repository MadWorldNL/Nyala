import 'package:flutter/material.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpResponseInput extends StatefulWidget {
  const HttpResponseInput({super.key});

  @override
  HttpResponseInputState createState() => HttpResponseInputState();
}

class HttpResponseInputState extends State<HttpResponseInput> {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();

  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? response;

  HttpResponseInputState() {
    _httpFormStorage.getBody().then((value) {
      setState(() {
        response = value;
      });
    });
  }

  void updateResponse(String value) {
    setState(() {
      response = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              readOnly: true,
              scrollController: _scrollController,
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Response',
                hintText: 'No response found',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              onChanged: (value) => updateResponse(value),
            )));
  }
}