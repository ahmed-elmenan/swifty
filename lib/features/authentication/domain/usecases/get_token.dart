import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/domain/repositories/auth_repository.dart';

class GetToken {
  final AuthRepository repository;

  GetToken(this.repository);

  Future<Either<Failure, Token>> call(String code) async{
    return await repository.getToken(code);
  }
}
