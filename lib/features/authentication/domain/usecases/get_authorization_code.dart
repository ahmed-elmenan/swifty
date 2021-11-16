import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/authorization_code.dart';
import 'package:swifty/features/authentication/domain/repositories/auth_repository.dart';

class GetAuthorizationCode {
  final AuthRepository repository;

  GetAuthorizationCode(this.repository);

  Future<Either<Failure, AuthorizationCode>> call() async {
    return await repository.getAuthorizationCode();
  }
}
