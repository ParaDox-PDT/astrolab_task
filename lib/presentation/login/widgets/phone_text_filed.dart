import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/colors.dart';

class PhoneTextField extends StatelessWidget {
   PhoneTextField(
      {super.key, required this.controller});

  var maskFormatter = MaskTextInputFormatter(
      mask: '+998#########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: false,
      textInputAction: TextInputAction.next,
      inputFormatters: [maskFormatter],
      keyboardType: TextInputType.phone,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
      decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20.sp,
          ),
          hintText: "Phone Number",
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.c_7CB1FF)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.c_7CB1FF)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.c_7CB1FF)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.c_7CB1FF)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.c_7CB1FF))),
    );
  }
}
