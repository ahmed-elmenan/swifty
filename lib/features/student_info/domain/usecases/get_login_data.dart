import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/student_info/domain/entities/login_data.dart';
import 'package:swifty/features/student_info/domain/repositories/login_data_repository.dart';

class GetLoginData {
  final LoginDataRepository repository;

  GetLoginData(this.repository);

  Future<Either<Failure, LoginData>> call(String login, Token token) async {
    return await repository.getLoginData(login, token);
  }
}
