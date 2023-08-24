import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';
import '../../widgets/text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late TextEditingController passwordController;
  bool isVisible = true;

  @override
  void initState() {
    passwordController=widget.passwordController;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GlobalTextField(
          hintText: "Password",
          textInputType: TextInputType.visiblePassword,
          controller: passwordController,
          isPassword: isVisible,
          textInputAction: TextInputAction.done,
        ),
        Positioned(
          right: 10.w,
          top: 18.h,
          child: ZoomTapAnimation(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Icon(
              isVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: isVisible
                  ? AppColors.passiveTextColor
                  : AppColors.c_7CB1FF,
            ),
          ),
        )
      ],
    );
  }
}
