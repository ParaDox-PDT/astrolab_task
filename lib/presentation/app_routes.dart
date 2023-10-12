import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/screenshot/screenshot_screen.dart';


import 'home/home_screen.dart';


class RouteNames {
  static const String homeScreen = "/home";
  static const String screenshot = "/";


}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.screenshot:
        return MaterialPageRoute(
          builder: (context) => const ScreenshotScreen(),
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