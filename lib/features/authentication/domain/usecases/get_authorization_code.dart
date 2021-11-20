import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/authorization_code.dart';
import '../repositories/auth_repository.dart';

class GetAuthorizationCode {
  final AuthRepository repository;

  GetAuthorizationCode(this.repository);

  Future<Either<Failure, AuthorizationCode>> call() async {
    return await repository.getAuthorizationCode();
  }
}
