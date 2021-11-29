import 'package:dartz/dartz.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import '../../../../core/error/failure.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/domain/entities/login_data.dart';
import '../../../login_data/domain/repositories/login_data_repository.dart';

class MapCursusToProjects {
  final LoginDataRepository repository;

  MapCursusToProjects(this.repository);

  Future<Either<Failure, ProjectsCursus>> call(LoginData loginData) async {
    return  repository.mapCursusToProjects(loginData);
  }
}