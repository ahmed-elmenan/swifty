part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  List propreties = const <dynamic>[];
  AuthenticationEvent([propreties]);
}

class AuthenticateUser extends AuthenticationEvent {
  String login;
  AuthenticateUser({@required this.login}) : super([login]);
}
