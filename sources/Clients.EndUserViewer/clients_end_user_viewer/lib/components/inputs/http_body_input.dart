import 'package:flutter/material.dart';
import 'package:nyala/components/layout/button_layout.dart';
import 'package:nyala/domain/https/http_body_types.dart';
import 'package:nyala/functions/formatters/formatter_factory.dart';
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
  HttpBodyTypes selectedType = HttpBodyTypes.json;
  String? body;

  @override
  void initState() {
    super.initState();
    _loadSavedBody();
  }

  void _loadSavedBody() async {
    var savedBody = await _httpFormStorage.getBody();
    body = savedBody;
    controller.text = savedBody;

    var savedBodyType = await _httpFormStorage.getBodyType();
    setState(() {
      selectedType = savedBodyType;
    });
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

  void _beautify() {
    if (body?.isEmpty ?? true) {
      return;
    }

    var formatter = FormatterFactory.getFormatter(selectedType);
    var newBody = formatter.format(body!);
    setState(() {
      body = newBody;
      controller.text = newBody;
    });
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
              Row(children: [
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
                ElevatedButton(
                  onPressed: () => {_beautify()},
                  style: ButtonLayout.getDefault(),
                  child: Text('Beautify'),
                )
              ]),
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
