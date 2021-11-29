import 'package:dartz/dartz.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import '../../../../core/error/failure.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/domain/entities/login_data.dart';

abstract class LoginDataRepository {
  Future<Either<Failure, LoginData>> getLoginData(String login, Token token);
  Future<Either<Failure, ProjectsCursus>> mapCursusToProjects(LoginData loginData);

}
