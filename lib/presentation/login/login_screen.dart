import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/login/login_cubit.dart';
import 'package:flutter_defualt_project/data/models/user_model/user_model.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/login_button.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/logo.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/password_textfield.dart';
import 'package:flutter_defualt_project/presentation/widgets/text_field.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: BlocConsumer<LoginCubit,LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  children: [
                    104.ph,
                    const LogoWidget(),
                    16.ph,
                    Text(
                      "Welcome to ParaDox App !!!",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    16.ph,
                    Text(
                      "Login to Continue",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.passiveTextColor),
                    ),
                    32.ph,
                    GlobalTextField(
                      hintText: "Username",
                      controller: usernameController,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    16.ph,
                    PasswordTextField(
                        passwordController: passwordController),
                    42.ph,
                    ZoomTapAnimation(
                      onTap: () {
                        if (usernameController.text.isNotEmpty) {
                          if (passwordController.text.isNotEmpty) {
                            context.read<LoginCubit>().loginUser(
                                username: usernameController.text,
                                password: passwordController.text);
                          } else {
                            showErrorMessage(
                                message: "Password is empty!",
                                context: context);
                          }
                        } else {
                          showErrorMessage(
                              message: "Username is empty!",
                              context: context);
                        }
                      },
                      child: const LoginButton(),
                    )
                  ],
                ),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is LoginErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if(state is LoginSuccessHomeState){
            Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
          }
          if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginEditScreen);
          }
        },
      ),
    );
  }
}
