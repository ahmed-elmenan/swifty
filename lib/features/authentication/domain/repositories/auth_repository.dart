import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/authorization_code.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> getToken(String code);
  Future<Either<Failure, AuthorizationCode>> getAuthorizationCode();
}