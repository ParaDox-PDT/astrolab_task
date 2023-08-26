import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/login/login_cubit.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/models/user_model/user_model.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/login_button.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/logo.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/password_textfield.dart';
import 'package:flutter_defualt_project/presentation/login/widgets/phone_text_filed.dart';
import 'package:flutter_defualt_project/presentation/widgets/text_field.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/ui_utils/loading_dialog.dart';
import 'package:flutter_defualt_project/utils/util_function.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';
import '../../utils/ui_utils/error_message_dialog.dart';

class LoginEditScreen extends StatefulWidget {
  const LoginEditScreen({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<LoginEditScreen> createState() => _LoginEditScreenState();
}

class _LoginEditScreenState extends State<LoginEditScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  late UniversalData universalData;
  late UserModel userModel;

  bool isLoading = false;

  _init() async {
    userModel = widget.userModel;

    usernameController.text = userModel.username;
    phoneController.text = getString(userModel.phone);
    firstNameController.text = userModel.name;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return isLoading
              ? Center(
                  child: Lottie.asset(AppImages.loading),
                )
              : ListView(
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
                            "Login Edit to Continue",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppColors.passiveTextColor),
                          ),
                          32.ph,
                          GlobalTextField(
                              hintText: "First name",
                              controller: firstNameController,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next),
                          16.ph,
                          PhoneTextField(
                            controller: phoneController,
                          ),
                          16.ph,
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
                              if (firstNameController.text.isNotEmpty) {
                                if (phoneController.text.isNotEmpty &&
                                    phoneController.text.length == 19) {
                                  if (usernameController.text.isNotEmpty) {
                                    if (passwordController.text.isNotEmpty) {
                                      debugPrint(
                                          "USERNAME: ${usernameController.text}");
                                      debugPrint(
                                          "PHONE: ${phoneController.text}");
                                      debugPrint(
                                          "NAME: ${firstNameController.text}");
                                      context.read<LoginCubit>().loginEdit(
                                          token: StorageRepository.getString(
                                              "tokens"),
                                          name: firstNameController.text,
                                          phone: changeString(
                                              phoneController.text),
                                          username: usernameController.text,
                                          password: passwordController.text,
                                          context: context);
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
                                } else {
                                  showErrorMessage(
                                      message: "Phone Number is incorrect!",
                                      context: context);
                                }
                              } else {
                                showErrorMessage(
                                    message: "First Name is empty!",
                                    context: context);
                              }
                            },
                            child: const LoginButton(),
                          )
                        ],
                      ),
                    )
                  ],
                );
        },
        listener: (context, state) {
          if (state is LoginLoadingState) {
            setState(() {
              isLoading=true;
            });
          }
          if (state is LoginErrorState) {
            setState(() {
              isLoading=false;
            });
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is LoginEditSuccessState) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
      ),
    );
  }
}
