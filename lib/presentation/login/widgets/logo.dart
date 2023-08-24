import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.w,
      height: 72.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          color: AppColors.c_25CE09),
      child: Center(
        child: Text(
          "P",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
