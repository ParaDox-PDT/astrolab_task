import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key, required this.text, required this.text2});
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text:",
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.white.withOpacity(0.6),
              fontWeight: FontWeight.w400),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.white.withOpacity(0.8),
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
