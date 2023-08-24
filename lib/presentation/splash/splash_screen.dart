import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/login/login_cubit.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    BlocProvider.of<LoginCubit>(context).checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {

        return Center(
          child: Lottie.asset(AppImages.welcome),
        );
      },
      listener: (context, state) {
        if (state is UnLoggedState) {
          Navigator.pushReplacementNamed(context, RouteNames.loginScreen,arguments: true);
        }
        if (state is LoggedState) {
          Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
        }
      },
    ));
  }
}
