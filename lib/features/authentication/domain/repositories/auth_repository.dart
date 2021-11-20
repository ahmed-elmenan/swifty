import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/authorization_code.dart';
import '../entities/token.dart';

import '../entities/authorization_code.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> getToken(AuthorizationCode code);
  Future<Either<Failure, AuthorizationCode>> getAuthorizationCode();
}