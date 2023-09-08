import 'package:data/data/models/student/form_status.dart';
import 'package:data/data/models/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/student/student_bloc.dart';
import 'package:flutter_defualt_project/bloc/student/student_event.dart';
import 'package:flutter_defualt_project/bloc/student/student_state.dart';

import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<StudentBloc>(context).add(GetStudents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.blueAccent),
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Students Screen",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addScreen);
            },
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: BlocConsumer<StudentBloc, StudentState>(
        builder: (context, state) {
          return Column(
            children: [
              ...List.generate(state.students.length, (index) {
                StudentModel studentModel = state.students[index];
                return ZoomTapAnimation(
                  onLongTap: (){
                    context.read<StudentBloc>().add(DeleteStudent(id: studentModel.id));
                    context.read<StudentBloc>().add(GetStudents());
                  },
                  onTap: (){
                    Navigator.pushNamed(context, RouteNames.updateScreen,arguments: studentModel);
                  },
                  child: Container(
                    height: 140.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.c_3669C9,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              spreadRadius: 3)
                        ],
                        border: Border.all(width: 1, color: AppColors.c_3669C9)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text(
                              "Student Name: ${studentModel.studentName}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),

                            Text(
                              "Course: ${studentModel.course}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              "Contact: ${studentModel.contact}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              "Average Score: ${studentModel.averageScore}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              "Gender: ${studentModel.gender}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                          ],

                        ),

                      ],
                    ),
                  ),
                );
              })
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.pure) {
            context.read<StudentBloc>().add(GetStudents());
          }
        },
      ),
    );
  }
}
