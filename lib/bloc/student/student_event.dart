import 'package:data/data/models/student/student_model.dart';
import 'package:equatable/equatable.dart';


abstract class StudentEvent extends Equatable {}

class AddStudent extends StudentEvent {
  final StudentModel newStudent;

  AddStudent({required this.newStudent});

  @override
  List<Object?> get props => [newStudent];
}

class GetStudents extends StudentEvent {
  @override
  List<Object?> get props => [];
}

class UpdateStudent extends StudentEvent {
  final StudentModel updatedStudent;
  final int id;

  UpdateStudent({required this.updatedStudent,required this.id});

  @override
  List<Object?> get props => [updatedStudent];
}

class DeleteStudent extends StudentEvent {
  final int id;

  DeleteStudent({required this.id});

  @override
  List<Object?> get props => [id];
}