import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/utils/ui_utils/loading_dialog.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository}) : super(LoginInitial());

  final AuthRepository authRepository;

  Future<void> checkLoggedState() async {
    await Future.delayed(const Duration(seconds: 3));
    if (authRepository.getHomeToken().isEmpty) {
      emit(UnLoggedState());
    } else {
      emit(LoggedState());
    }
  }

  Future<UniversalData> getUser() async {
    emit(LoginLoadingState());
    UniversalData universalData = await authRepository.getUser(
        token: StorageRepository.getString("tokens"));
    if (universalData.error.isEmpty) {
      emit(GetUserSuccessState());
      return universalData;
    } else {
      emit(LoginErrorState(errorText: universalData.error));
      return universalData;
    }
  }

  Future<void> loginUser(
      {required String username, required String password}) async {
    emit(LoginLoadingState());
    UniversalData universalData =
        await authRepository.loginUser(username: username, password: password);
    late UniversalData universalData2;
    if (universalData.error.isEmpty) {
      if (!universalData.data["status"]) {
        await authRepository
            .putTokenInMain(universalData.data["token"] as String);
        universalData2 = await authRepository.getUser(token: StorageRepository.getString("tokens"));
        emit(LoginSuccessState(universalData: universalData2));
      } else {
        await authRepository.putToken(universalData.data["token"] as String);
        emit(LoginSuccessHomeState());
      }
    } else {
      emit(LoginErrorState(errorText: universalData.error));
    }
  }

  Future<void> loginEdit(
      {required String name,
      required String phone,
      required String username,
      required String password,required String token,required BuildContext context}) async {
    emit(LoginLoadingState());
    UniversalData universalData = await authRepository.loginEdit(
        name: name, phone: phone, username: username, password: password,token: token);
    if (universalData.error.isEmpty) {
      emit(LoginEditSuccessState());
    } else {
      emit(LoginErrorState(errorText: universalData.error));
    }
  }

  Future<void> logOutUser() async {
    // emit(LoginLoadingState());
    bool? isDeleted = await authRepository.deleteToken();
    bool? isDelete = await authRepository.deleteTokens();
    if (isDeleted != null) {
      emit(UnLoggedState());
    }
  }
}
