import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/data/models/user_model/user_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.blueAccent),
        title: Text(
          "Users table",
          style: TextStyle(fontSize: 20.sp, color: AppColors.black),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ReorderableListView(
        physics:const BouncingScrollPhysics(),
        children: [
          ...List.generate(
            users.length,
            (index) => Dismissible(
              key: ValueKey(users[index].name),
              child: Column(
                key: ValueKey(index),
                children: [
                  ListTile(
                    title: Text(
                      users[index].name,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle:Text(
                      users[index].phone,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.passiveTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      users[index].date,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500),
                    ),

                  ),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: AppColors.passiveTextColor,
                  )
                ],
              ),
              onDismissed: (direction) {
                setState(() {
                  users.removeAt(index);
                });
              },
            ),
          )
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -=1;
            }
            final UserModel userModel = users.removeAt(oldIndex);
            users.insert(newIndex, userModel);
          });
        },
      ),
    );
  }
}
