import 'package:swifty/features/login_data/data/model/cursus_details_model.dart';
import 'package:swifty/features/login_data/data/model/cursus_model.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/data/model/project_details_model.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import 'package:meta/meta.dart';

abstract class LoginDataLocalDataSource {
  ManagedCursus mapCursusToProjects(LoginData loginData);
}

class LoginDataLocalDataSourceImpl extends LoginDataLocalDataSource {
  final managedCursus = ManagedCursus();

  // LoginDataLocalDataSourceImpl({@required this.managedCursus});

  @override
  ManagedCursus mapCursusToProjects(LoginData loginData) {
    _collectLoginCursusInfo(loginData);
    _cursusMapingProcess(loginData);

    return managedCursus;
  }

  _collectLoginCursusInfo(LoginData loginData) {
    int i = 0;
    loginData.cursus_users.forEach((cursus) {
      managedCursus.projectCursusMap[cursus.cursus.id] = ProjectsCursus(
        cursusInfo: cursus,
      );
      print(++i);
      managedCursus.cursusNames.add(cursus.cursus.name);
      managedCursus.cursusNamesMap[cursus.cursus.name] = cursus.cursus.id;
    });
  }

  _cursusMapingProcess(LoginData loginData) {
    print(loginData.projects_users.length);
    loginData.projects_users.forEach((project) {
      project.cursus_ids.forEach((id) {
        final projects = managedCursus.projectCursusMap[id].projectDetails;
        if (projects == null)
          managedCursus.projectCursusMap[id].projectDetails = [];
        managedCursus.projectCursusMap[id].projectDetails.add(project);
      });
    });
  }
}
