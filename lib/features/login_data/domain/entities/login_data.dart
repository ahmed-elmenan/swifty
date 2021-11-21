import '../../../login_data/data/model/cursus_model.dart';
import '../../../login_data/data/model/project_details_model.dart';

class LoginData {
  final String login;
  final String level;
  final String usual_full_name;
  final String image_url;
  final String email;
  final int correction_point;
  final String location;
  final int wallet;
  final List<CursusModel> cursus_users;
  final List<ProjectDetailsModel> projects_users;
  int loginNotFound;
  
  LoginData(
      {this.projects_users,
      this.login,
      this.level,
      this.usual_full_name,
      this.image_url,
      this.email,
      this.correction_point,
      this.location,
      this.wallet,
      this.cursus_users});
}
