import 'package:flutter/material.dart';

import 'home/home_screen.dart';


class RouteNames {
  static const String homeScreen = "/home";
  static const String loginScreen = "/login";
  static const String splashScreen = "/";
  static const String loginEditScreen = "/login_edit";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}