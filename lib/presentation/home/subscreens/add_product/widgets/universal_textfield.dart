import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField({super.key, required this.title, required this.controller, required this.textInputType,this.maskFormatter,});
  final String title;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputFormatter? maskFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.white),
        ),
        10.ph,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.c_7CB1FF.withOpacity(0.05)),
          child: TextField(
            keyboardType: textInputType,
            inputFormatters: maskFormatter != null ? [maskFormatter!] : [],
            textInputAction: TextInputAction.next,
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                    width: 0, color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.black),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                    width: 1, color: AppColors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
