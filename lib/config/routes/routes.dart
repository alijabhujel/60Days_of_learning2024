import 'package:bloc_state_manage/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../ui/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.login:
        return MaterialPageRoute(builder: (context) => Login_Screen());
      case Routesname.todo:
        return MaterialPageRoute(builder: (context) => Todo_Screen());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No routes found'),
            ),
          );
        });
    }
  }
}
