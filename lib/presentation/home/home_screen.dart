import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/login/login_cubit.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/ui_utils/loading_dialog.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=false;

  @override
  void initState() {
    debugPrint("TOKEN: ${StorageRepository.getString("token")}");
    debugPrint("TOKENS: ${StorageRepository.getString("tokens")}");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Screen",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          builder: (context, state) {
            return Center(
              child: isLoading?Lottie.asset(AppImages.loading):TextButton(
                child: Text("Log Out"),
                onPressed: () {
                  context.read<LoginCubit>().logOutUser();
                },
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginLoadingState) {
              setState(() {
                isLoading=true;
              });
            }
            if (state is UnLoggedState) {
              Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
            }
          },
        ));
  }
}
