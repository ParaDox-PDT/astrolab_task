import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/presentation/screenshot/widgets/row_item.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/permissions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ScreenshotScreen extends StatefulWidget {
  const ScreenshotScreen({super.key});

  @override
  State<ScreenshotScreen> createState() => _ScreenshotScreenState();
}

class _ScreenshotScreenState extends State<ScreenshotScreen> {
  final GlobalKey checkKey = GlobalKey();

  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.textColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColors.textColor,
        leading: IconButton(
          splashRadius: 20.r,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Hisobotlar"),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 20.r,
            onPressed: () {
              saveToGallery();
            },
            icon: const Icon(
              Icons.share,
              color: Color(0xFF0218F8),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          RepaintBoundary(
            key: checkKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.humo,
                    width: 70.w,
                  ),
                  10.ph,
                  Text(
                    "Perevod s karti na kartu",
                    style: TextStyle(color: AppColors.white.withOpacity(0.8)),
                  ),
                  12.ph,
                  Text(
                    "17 00 so'm",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                  ),
                  18.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: const Color(0xFF0218F8),
                        size: 50.sp,
                      ),
                      8.pw,
                      Text(
                        "Muvaffaqiyatli",
                        style: TextStyle(
                            color: const Color(0xFF0218F8),
                            fontWeight: FontWeight.w600,
                            fontSize: 30.sp),
                      ),
                    ],
                  ),
                  6.ph,
                  const RowItem(
                      text: "Sana va vaqt", text2: "12.10.2023 16:02 da"),
                  6.ph,
                  const RowItem(
                      text: "To'lov kartasi", text2: "986008******6959"),
                  6.ph,
                  const RowItem(
                      text: "Yuboruvchi", text2: "DONIYOR JO'RABEKOV"),
                  6.ph,
                  const RowItem(
                      text: "Qabul qiluvchining kartasi",
                      text2: "860003******9385"),
                  6.ph,
                  const RowItem(
                      text: "Qabul qiluvchi", text2: "XAYDAROV XUSNIDDIN"),
                  6.ph,
                  const RowItem(text: "To'lov raqami", text2: "2793323922"),
                  10.ph,
                  Divider(
                    thickness: 1,
                    color: Colors.grey.shade800,
                  ),
                  6.ph,
                  const RowItem(text: "Komissiya", text2: "170 so'm"),
                  6.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cashback:",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "25.5 so'm (0.15%)",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF0218F8).withOpacity(0.9),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      saveToGallery();
                    },
                    child: Container(
                      width: 100.w,
                      height: 150.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.download,
                            color: const Color(0xFF0218F8).withOpacity(0.7),
                            size: 40.sp,
                          ),
                          20.ph,
                          const Expanded(
                            child: Text(
                              "Save to Gallery",
                              style: TextStyle(color: AppColors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      _takeScreenshot();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      width: 100.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.black54,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.screenshot,
                            color: const Color(0xFF0218F8).withOpacity(0.7),
                            size: 40.sp,
                          ),
                          20.ph,
                          const Expanded(
                            child: Text(
                              "Screenshot",
                              style: TextStyle(color: AppColors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _takeScreenshot<Uint8List>() async {
    RenderRepaintBoundary boundary =
        checkKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var im = await boundary.toImage();
    var byteData = await im.toByteData(format: ImageByteFormat.png);

    const String fileName = 'screenshot.png';
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName';
    File(filePath).writeAsBytesSync(imageBytes!);
    Share.shareFiles([filePath]);
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text("Screenshot was successful")));
    return byteData!.buffer.asUint8List();
  }

  saveToGallery() async {
    await PermissionUtil.requestAll();
    var pngBytes = await _takeScreenshot();
    var t = await ImageGallerySaver.saveImage(pngBytes);
  }
}
