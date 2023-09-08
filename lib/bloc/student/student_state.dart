import 'package:data/data/models/student/form_status.dart';
import 'package:data/data/models/student/student_model.dart';
import 'package:equatable/equatable.dart';


class StudentState extends Equatable {
  const StudentState({
    required this.status,
    required this.statusText,
    required this.students,
  });

  final FormStatus status;
  final List<StudentModel> students;
  final String statusText;

  StudentState copyWith({
    FormStatus? status,
    List<StudentModel>? students,
    String? statusText,
  }) =>
      StudentState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        students: students ?? this.students,
      );

  @override
  List<Object?> get props => [
    status,
    students,
    statusText,
  ];
}