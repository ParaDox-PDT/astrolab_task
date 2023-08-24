import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 58.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.c_1FA309),
      child: Center(
        child: Text(
          "Login",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),
        ),
      ),
    );
  }
}
