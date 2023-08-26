part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UniversalData universalData;
  LoginSuccessState({required this.universalData});
}

class LoginEditSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorText;

  LoginErrorState({required this.errorText});
}

class UnLoggedState extends LoginState {}

class LoggedState extends LoginState {}

class LoginSuccessHomeState extends LoginState {}

class LoginHideLoadingState extends LoginState {}

class GetUserSuccessState extends LoginState {}
