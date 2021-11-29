import 'package:swifty/features/login_data/data/model/cursus_model.dart';
import 'package:swifty/features/login_data/data/model/project_details_model.dart';

class ProjectsCursus {
  List<ProjectDetailsModel> projectDetails = [];
  final CursusModel cursusInfo;

  ProjectsCursus({ this.projectDetails, this.cursusInfo});
}
