import 'package:flutter/material.dart';
import 'package:nyala/domain/https/http_methodes.dart';
import 'package:nyala/functions/https/http_form_storage.dart';

class HttpMethodesDropdown extends StatefulWidget {
  const HttpMethodesDropdown({super.key});

  @override
  HttpMethodesDropdownState createState() => HttpMethodesDropdownState();
}

class HttpMethodesDropdownState extends State<HttpMethodesDropdown> {
  final HttpFormStorage _httpFormStorage = HttpFormStorage();
  HttpMethodes? selectedMethode = HttpMethodes.get; 

  @override
  void initState() {
    super.initState();
    _loadSavedMethod();
  }

  Future<void> _loadSavedMethod() async {
    var savedMethode = await _httpFormStorage.getMethod();
    setState(() {
      selectedMethode = savedMethode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<HttpMethodes>(
          hint: Text("Select an option"),
          alignment: Alignment.center,
          value: selectedMethode,
          items: HttpMethodes.values
              .take(HttpMethodes.values.length)
              .map((httpType) {
            return DropdownMenuItem<HttpMethodes>(
              value: httpType,
              child: Text(httpType.name),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedMethode = value;
              _httpFormStorage.saveMethod(value!);
            });
          },
        ));
  }
}
