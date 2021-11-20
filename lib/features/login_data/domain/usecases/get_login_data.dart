import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/domain/entities/login_data.dart';
import '../../../login_data/domain/repositories/login_data_repository.dart';

class GetLoginData {
  final LoginDataRepository repository;

  GetLoginData(this.repository);

  Future<Either<Failure, LoginData>> call(String login, Token token) async {
    return await repository.getLoginData(login, token);
  }
}
