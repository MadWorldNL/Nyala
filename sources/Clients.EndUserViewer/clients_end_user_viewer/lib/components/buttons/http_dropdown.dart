import 'package:flutter/material.dart';
import 'package:nyala/domain/https/http_methodes.dart';

class HttpMethodesDropdown extends StatefulWidget {
  const HttpMethodesDropdown({super.key});

  @override
  HttpMethodesDropdownState createState() => HttpMethodesDropdownState();
}

class HttpMethodesDropdownState extends State<HttpMethodesDropdown> {
  HttpMethodes? selectedType = HttpMethodes.get; // Holds the selected value

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<HttpMethodes>(
          hint: Text("Select an option"),
          alignment: Alignment.center,
          value: selectedType,
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
              selectedType = value; // Update the selected value
            });
          },
        ));
  }
}
