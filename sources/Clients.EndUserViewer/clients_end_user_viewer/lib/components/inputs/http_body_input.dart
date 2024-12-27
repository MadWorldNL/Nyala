import 'package:flutter/material.dart';
import 'package:nyala/domain/https/http_body_types.dart';
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
  HttpBodyTypes? selectedType = HttpBodyTypes.json;
  String? body;

  HttpBodyInputState() {
    init();
  }

  void init() async {
    var savedBody = await _httpFormStorage.getBody();
    body = savedBody;
    controller.text = savedBody;
  }

  void setSelectedType(HttpBodyTypes type) {
    setState(() {
      selectedType = type;
    });

    _httpFormStorage.saveBodyType(type);
    if (type == HttpBodyTypes.none) {
      setBody('');
    }
  }

  void setBody(String value) {
    setState(() {
      body = value;
    });

    _httpFormStorage.saveBody(value);
  }

  DropdownMenuItem<HttpBodyTypes> buildDropdownMenuItem(HttpBodyTypes type) {
    return DropdownMenuItem<HttpBodyTypes>(
      value: type,
      child: Text(type.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              DropdownButton<HttpBodyTypes>(
                hint: Text("Select an option"),
                alignment: Alignment.center,
                value: selectedType,
                items: [
                  buildDropdownMenuItem(HttpBodyTypes.none),
                  buildDropdownMenuItem(HttpBodyTypes.text),
                  buildDropdownMenuItem(HttpBodyTypes.javascript),
                  buildDropdownMenuItem(HttpBodyTypes.json),
                  buildDropdownMenuItem(HttpBodyTypes.html),
                  buildDropdownMenuItem(HttpBodyTypes.xml),
                ],
                onChanged: (type) {
                  setSelectedType(type!);
                },
              ),
              if (selectedType != HttpBodyTypes.none)
                TextField(
                  controller: controller,
                  scrollController: _scrollController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 10,
                  onChanged: (value) => {setBody(value)},
                  decoration: InputDecoration(
                    labelText: 'Body',
                    hintText: 'Enter body or past text',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                )
            ])));
  }
}
