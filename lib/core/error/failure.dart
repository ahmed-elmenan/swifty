import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List properties = const <dynamic>[];

  Failure([properties]);

  @override
  List<Object> get props => properties;
}


// Genaral Failures
class ServerFailure extends Failure {}
class NetworkFailure extends Failure {}
class TokenExpirationFailure extends Failure {}
class InvalidInputFailure extends Failure {}
class LoginNotFoundFailure extends Failure {}

