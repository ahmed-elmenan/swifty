part of 'authentication_bloc.dart';

abstract class AuthenticationState {
  List propreties = const <dynamic>[];
  AuthenticationState([propreties]);
}

class AuthenticationInitial extends AuthenticationState {}

class Loading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final Token token;


  Authenticated({@required this.token}) : super([token]);
}

class Error extends AuthenticationState {
  final String message;

  Error({@required this.message}) : super([message]);
}
