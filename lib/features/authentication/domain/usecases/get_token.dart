import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/domain/repositories/auth_repository.dart';

import '../entities/authorization_code.dart';

class GetToken {
  final AuthRepository repository;

  GetToken(this.repository);

  Future<Either<Failure, Token>> call(AuthorizationCode code) async{
    return await repository.getToken(code);
  }
}
