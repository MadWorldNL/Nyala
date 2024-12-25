import 'package:flutter/material.dart';
import 'package:nyala/pages/developer.dart';
import 'package:nyala/pages/grpc_endpoints_tester.dart';
import 'package:nyala/pages/home.dart';
import 'package:nyala/pages/http_endpoints_tester.dart';

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
            PopupMenuItem<int>(value: 1, child: Text('Http')),
            PopupMenuItem<int>(value: 2, child: Text('Grpc')),
            PopupMenuItem<int>(value: 3, child: Text('Developer')),
          ],
        ),
        title: Text(contextName));
  }

  void handleClick(BuildContext context, int item) {
    switch (item) {
      case 0:
        navigate(context, const HomePage());
        break;
      case 1:
        navigate(context, HttpEndpointsTester());
        break;
      case 2:
        navigate(context, const GrpcEndpointsTester());
        break;
      case 3:
        navigate(context, DeveloperPage());
        break;
    }
  }

  void navigate(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
