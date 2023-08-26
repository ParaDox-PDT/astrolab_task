import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/user_model/user_model.dart';
import 'package:flutter_defualt_project/presentation/login/login_edit_screen.dart';
import 'package:flutter_defualt_project/presentation/login/login_screen.dart';
import 'package:flutter_defualt_project/presentation/splash/splash_screen.dart';

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
      case RouteNames.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteNames.loginEditScreen:
        return MaterialPageRoute(
          builder: (context) =>  LoginEditScreen(userModel: settings.arguments as UserModel,),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
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