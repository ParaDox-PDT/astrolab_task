import 'package:data/data/local/db/local_database.dart';
import 'package:data/data/models/student/form_status.dart';
import 'package:data/data/models/student/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/student/student_event.dart';
import 'package:flutter_defualt_project/bloc/student/student_state.dart';

import 'package:flutter_defualt_project/utils/constants.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc()
      : super(
          const StudentState(
            status: FormStatus.pure,
            statusText: "",
            students: [],
          ),
        ) {
    on<AddStudent>(_addUser);
    on<GetStudents>(_getUsers);
    on<UpdateStudent>(_updateUser);
    on<DeleteStudent>(_deleteUser);
  }

  _addUser(AddStudent event, Emitter<StudentState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userAdd,
      ),
    );
    await LocalDatabase.insertStudent(event.newStudent);
    emit(
      state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.userAdd,
          students: [...state.students, event.newStudent]),
    );
  }

  _getUsers(GetStudents event, Emitter<StudentState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.gotAllUsers,
      ),
    );
    debugPrint("ISHLADI");
    List<StudentModel> newStudents = await LocalDatabase.getAllStudents();
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: StatusTextConstants.gotAllUsers,
        students: newStudents,
      ),
    );
  }

  _updateUser(UpdateStudent event, Emitter<StudentState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userUpdate,
      ),
    );
    await LocalDatabase.updateStudent(studentModel: event.updatedStudent,id: event.id);
    print("UPDATEEE");
    emit(
      state.copyWith(
        status: FormStatus.pure,
        statusText: StatusTextConstants.userUpdate,
      ),
    );
  }

  _deleteUser(DeleteStudent event, Emitter<StudentState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userDelete,
      ),
    );
    await LocalDatabase.deleteStudent(event.id);
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: StatusTextConstants.userDelete,
      ),
    );
  }
}
