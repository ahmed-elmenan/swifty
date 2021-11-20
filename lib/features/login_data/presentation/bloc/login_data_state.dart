part of 'login_data_bloc.dart';

abstract class LoginDataState {
  List propreties = const <dynamic>[];
  LoginDataState([propreties]);
}

class LoginDataStateInitial extends LoginDataState {}

class LoginDataLoading extends LoginDataState {}

class LoginDataLoaded extends LoginDataState {
  final LoginData loginData;

  LoginDataLoaded({@required this.loginData}) : super([loginData]);
}

class LoginDataError extends LoginDataState {
  final String message;

  LoginDataError({@required this.message}) : super([message]);
}