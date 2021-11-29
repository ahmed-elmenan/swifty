import 'package:swifty/features/login_data/data/model/cursus_model.dart';
import 'package:swifty/features/login_data/data/model/project_details_model.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';

abstract class LoginDataRemoteDataSource {
  Map<int, ProjectsCursus> mapCursusToProjects(LoginData loginData);
}

class LoginDataRemoteDataSourceImpl extends LoginDataRemoteDataSource {
  Map<int, ProjectsCursus> _projectCursusMap = {};

  @override
  Map<int, ProjectsCursus> mapCursusToProjects(LoginData loginData) {
    _collectLoginCursusInfo(loginData);
    _cursusMapingProcess(loginData);

    return _projectCursusMap;
  }

  _collectLoginCursusInfo(LoginData loginData) {
    loginData.cursus_users.forEach((cursus) {
      _projectCursusMap[cursus.cursus.id] = ProjectsCursus(
        cursusInfo: cursus,
      );
    });
  }

  _cursusMapingProcess(LoginData loginData) {
    print(loginData.projects_users.length);
    loginData.projects_users.forEach((project) {
      project.cursus_ids.forEach((id) {
        final projects = _projectCursusMap[id].projectDetails;
        if (projects == null) _projectCursusMap[id].projectDetails = [];
        _projectCursusMap[id].projectDetails.add(project);
      });
    });
  }
}
