import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';

import 'cursus_details_model.dart';

class ManagedCursus {
  Map<int, ProjectsCursus> projectCursusMap = {};
  List<String> cursusNames = [];
  Map<String, dynamic> cursusNamesMap = {};
}
