import 'package:swifty/features/student_info/data/model/cursus.dart';
import 'package:swifty/features/student_info/data/model/project_details.dart';

class LoginData {
  final String login;
  final String level;
  final String usualFullName;
  final String imageUrl;
  final String email;
  final String correctionPoint;
  final String location;
  final String wallet;
  final List<Cursus> cursusUsers;
  final List<ProjectDetails> projectsUsers;

  LoginData({this.projectsUsers, this.login, this.level, this.usualFullName, this.imageUrl, this.email, this.correctionPoint, this.location, this.wallet, this.cursusUsers}); 

}




