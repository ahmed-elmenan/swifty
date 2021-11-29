part of 'login_data_bloc.dart';

abstract class LoginDataEvent {
  List propreties = const <dynamic>[];
  LoginDataEvent(propreties);
}

class FetchLoginData extends LoginDataEvent {
  String login;
  Token token;

  FetchLoginData(this.login, this.token) : super([login, token]);
}

class ManageCursuses extends LoginDataEvent {
  LoginData loginData;

  ManageCursuses(this.loginData) : super([loginData]);
}
