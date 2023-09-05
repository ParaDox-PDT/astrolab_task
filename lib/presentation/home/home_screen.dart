import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/getx_controllers/word_controller.dart';
import 'package:flutter_defualt_project/data/models/definition/info_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WordController wordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Search Word Definition",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: ListView(
          children: [
            16.ph,
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                wordController.word.value = value;
              },
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16.sp),
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ),
                  hintText: "Search",
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.c_7CB1FF)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.c_7CB1FF)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.c_7CB1FF)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.c_7CB1FF)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.c_7CB1FF))),
            ),
            30.ph,
            ZoomTapAnimation(
              onTap: ()async {
                await wordController.getWordDefinitionList(context: context);
                wordController.isSearchTapped.value = true;
                setState(() {});
              },
              child: Container(
                width: 200,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            wordController.wordsInfo.value.isNotEmpty
                ? Column(children: [
                    ...List.generate(
                      wordController
                          .wordInfo.value.meanings[0].definitions.length,
                      (index) {
                        InfoModel infoModel = wordController.wordInfo.value;
                        return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.r),
                            margin: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 1, color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Part of Speech: ${infoModel.meanings[0].partOfSpeech}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Definition: ",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    infoModel.meanings[0].definitions[index]
                                        .definition,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500))
                              ],
                            ));
                      },
                    )
                  ])
                : const SizedBox(
                    height: 0,
                  )
          ],
        ),
      ),
    );
  }
}
