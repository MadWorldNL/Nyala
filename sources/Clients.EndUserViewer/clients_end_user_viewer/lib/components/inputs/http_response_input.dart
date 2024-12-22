import 'package:flutter/material.dart';

class HttpResponseInput extends StatefulWidget {
  const HttpResponseInput({super.key});

  @override
  HttpResponseInputState createState() => HttpResponseInputState();
}

class HttpResponseInputState extends State<HttpResponseInput> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? response;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              scrollController: _scrollController,
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Response',
                hintText: 'Enter response or past text',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            )));
  }
}