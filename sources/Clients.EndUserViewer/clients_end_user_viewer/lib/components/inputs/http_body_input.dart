import 'package:flutter/material.dart';

class HttpBodyInput extends StatefulWidget {
  const HttpBodyInput({super.key});

  @override
  HttpBodyInputState createState() => HttpBodyInputState();
}

class HttpBodyInputState extends State<HttpBodyInput> {
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
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Body',
                hintText: 'Enter body or past text',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            )));
  }
}