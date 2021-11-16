part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticateUser extends AuthenticationEvent {
  
  AuthenticateUser();
}
