import 'package:flutter/material.dart';

class MainMenu extends AppBar {
  final String contextName;

  MainMenu({super.key, required this.contextName})
      : super(
        backgroundColor: Colors.green, 
        title: Text(contextName));

  @override
  List<Widget>? get actions => <Widget>[
        PopupMenuButton<int>(
          onSelected: (item) => handleClick(item),
          icon: Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0, child: Text('Logout')),
            PopupMenuItem<int>(value: 1, child: Text('Settings')),
          ],
        ),
      ];

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
