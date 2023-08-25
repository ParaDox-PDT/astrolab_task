import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/login/login_cubit.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: TextButton(
                child: Text("Log Out"),
                onPressed: () {
                  context.read<LoginCubit>().logOutUser();
                },
              ),
            );
          },
          listener: (context, state) {
            if (state is UnLoggedState) {
              Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
            }
          },
        ));
  }
}
