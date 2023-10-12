import 'package:flutter/material.dart';

import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            20.ph,
            Lottie.asset(AppImages.shop,width: 150.w,fit: BoxFit.cover),
            180.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ZoomTapAnimation(
                  onTap: (){},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    width: 100.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.black54),
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart_checkout,
                          color: const Color(0xFF0218F8),
                          size: 32.sp,
                        ),
                        10.ph,
                        const Expanded(
                          child: Text(
                            "Sell product",
                            style: TextStyle(color: AppColors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: (){},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    width: 100.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.black54),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: const Color(0xFF0218F8),
                          size: 32.sp,
                        ),
                        10.ph,
                        const Expanded(
                          child: Text(
                            "Add product",
                            style: TextStyle(color: AppColors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
