import 'package:flutter/material.dart';
import 'package:nyala/pages/contact.dart';
import 'package:nyala/pages/home.dart';

class MainMenu extends StatelessWidget implements PreferredSizeWidget {
  final String contextName;

  const MainMenu({super.key, required this.contextName});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.green,
        leading: PopupMenuButton<int>(
          onSelected: (item) => handleClick(context, item),
          icon: Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0, child: Text('Home')),
            PopupMenuItem<int>(value: 1, child: Text('Contact')),
          ],
        ),
        title: Text(contextName));
  }

  static void handleClick(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactPage()),
        );
        break;
    }
  }
}
