import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/home/subscreens/add_product/add_product_screen.dart';
import 'package:flutter_defualt_project/presentation/home/subscreens/sell_product/sell_product_screen.dart';
import 'package:flutter_defualt_project/presentation/splash/splash_screen.dart';

import 'home/home_screen.dart';
import 'home/subscreens/add_product/qr_screen.dart';


class RouteNames {
  static const String homeScreen = "/home";
  static const String splashScreen = "/";
  static const String addScreen = "/add";
  static const String sellScreen = "/sell";
  static const String qr = "/qr";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.qr:
        return MaterialPageRoute(
          builder: (context) => const QRViewExample(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.sellScreen:
        return MaterialPageRoute(
          builder: (context) => const SellProductScreen(),
        );
      case RouteNames.addScreen:
        return MaterialPageRoute(
          builder: (context) => const AddProductScreen(),
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