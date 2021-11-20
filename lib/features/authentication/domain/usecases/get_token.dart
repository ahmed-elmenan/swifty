import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/token.dart';
import '../repositories/auth_repository.dart';

import '../entities/authorization_code.dart';

class GetToken {
  final AuthRepository repository;

  GetToken(this.repository);

  Future<Either<Failure, Token>> call(AuthorizationCode code) async{
    return await repository.getToken(code);
  }
}
