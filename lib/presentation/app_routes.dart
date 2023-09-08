import 'package:data/data/models/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/home/home_screen.dart';
import 'package:flutter_defualt_project/presentation/home/subscreen/student_add_screen.dart';
import 'package:flutter_defualt_project/presentation/home/subscreen/student_update_screen.dart';


class RouteNames {
  static const String homeScreen = "/";
  static const String addScreen = "/add";
  static const String updateScreen = "/update";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.addScreen:
        return MaterialPageRoute(
          builder: (context) => const StudentAddScreen(),
        );
      case RouteNames.updateScreen:
        return MaterialPageRoute(
          builder: (context) =>  StudentUpdateScreen(studentModel: settings.arguments as StudentModel),
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