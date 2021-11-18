import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/student_info/domain/entities/login_data.dart';

abstract class LoginDataRepository {
  Future<Either<Failure, LoginData>> getLoginData(String login, Token token);
}

