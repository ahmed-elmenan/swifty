import 'package:swifty/features/student_info/data/model/cursus_model.dart';
import 'package:swifty/features/student_info/data/model/project_details_model.dart';

class LoginData {
  final String login;
  final String level;
  final String usualFullName;
  final String imageUrl;
  final String email;
  final String correctionPoint;
  final String location;
  final String wallet;
  final List<CursusModel> cursusUsers;
  final List<ProjectDetailsModel> projectsUsers;

  LoginData(
      {this.projectsUsers,
      this.login,
      this.level,
      this.usualFullName,
      this.imageUrl,
      this.email,
      this.correctionPoint,
      this.location,
      this.wallet,
      this.cursusUsers});
}
