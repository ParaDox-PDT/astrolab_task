import 'package:data/data/models/student/form_status.dart';
import 'package:data/data/models/student/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/student/student_bloc.dart';
import 'package:flutter_defualt_project/bloc/student/student_event.dart';
import 'package:flutter_defualt_project/bloc/student/student_state.dart';

import 'package:flutter_defualt_project/presentation/widgets/global_button.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_text_field.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';

class StudentAddScreen extends StatefulWidget {
  const StudentAddScreen({super.key});

  @override
  State<StudentAddScreen> createState() => _StudentAddScreenState();
}

class _StudentAddScreenState extends State<StudentAddScreen> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController averageScoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blueAccent),
        title: const Text("Student Add"),
        centerTitle: true,
      ),
      body: BlocConsumer<StudentBloc, StudentState>(
        builder: (context, state) {
          return ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              GlobalTextField(
                  hintText: "Student Name",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  controller: studentNameController),
              GlobalTextField(
                  hintText: "Course",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  controller: courseController),
              GlobalTextField(
                  hintText: "Contact",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  controller: contactController),
              GlobalTextField(
                  hintText: "Gender",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  controller: genderController),
              GlobalTextField(
                  hintText: "Average Score",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.start,
                  controller: averageScoreController),
              const SizedBox(
                height: 30,
              ),
              GlobalButton(
                  title: "Add User",
                  onTap: () {
                    if (studentNameController.text.isNotEmpty &&
                        courseController.text.isNotEmpty &&
                        averageScoreController.text.isNotEmpty &&
                        genderController.text.isNotEmpty &&
                        contactController.text.isNotEmpty) {
                      BlocProvider.of<StudentBloc>(context).add(AddStudent(
                          newStudent: StudentModel(
                              avatar: "",
                              contact: contactController.text,
                              gender: genderController.text,
                              studentName: studentNameController.text,
                              course: int.parse(courseController.text),
                              averageScore: int.parse(averageScoreController.text))));
                    } else {
                      showErrorMessage(
                          message: "Malumotlar to'liq emas", context: context);
                    }
                  })
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            Navigator.pop(context);
          }
          if (state.status == FormStatus.error) {
            showErrorMessage(message: state.statusText, context: context);
          }
        },
      ),
    );
  }
}
