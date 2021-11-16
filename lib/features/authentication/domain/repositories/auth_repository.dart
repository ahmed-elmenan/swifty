import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/authorization_code.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';

import '../entities/authorization_code.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> getToken(AuthorizationCode code);
  Future<Either<Failure, AuthorizationCode>> getAuthorizationCode();
}