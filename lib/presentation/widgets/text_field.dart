import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintText, required this.controller, required this.textInputType, required this.textInputAction, this.isPassword=false});
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
      decoration: InputDecoration(
          suffixIcon: SizedBox(width: 20.sp,),
          hintText: hintText,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1,color: AppColors.c_7CB1FF)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1,color: AppColors.c_7CB1FF)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1,color: AppColors.c_7CB1FF)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1,color: AppColors.c_7CB1FF)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1,color: AppColors.c_7CB1FF)
          )
      ),
    );
  }
}
