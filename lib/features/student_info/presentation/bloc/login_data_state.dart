part of 'login_data_bloc.dart';

abstract class LoginDataState {
  List propreties = const <dynamic>[];
  LoginDataState([propreties]);
}

class LoginDataStateInitial extends LoginDataState {}

class Loading extends LoginDataState {}

class Loaded extends LoginDataState {
  final LoginData loginData;

  Loaded({@required this.loginData}) : super([loginData]);
}

class Error extends LoginDataState {
  final String message;

  Error({@required this.message}) : super([message]);
}