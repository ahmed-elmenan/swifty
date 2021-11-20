import 'package:meta/meta.dart';
import '../../../login_data/data/model/project_details_model.dart';
import '../../../login_data/domain/entities/login_data.dart';

import 'cursus_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel extends LoginData {

  static String usersEndPoint = 'users/';
  LoginDataModel(
      {@required String image_url,
      @required int correction_point,
      @required int wallet,
      @required List<CursusModel> cursus_users,
      @required String usual_full_name,
      @required String location,
      @required String login,
      @required String level,
      @required String email,
      @required List<ProjectDetailsModel> projects_users})
      : super(
            image_url: image_url,
            correction_point: correction_point,
            wallet: wallet,
            usual_full_name: usual_full_name,
            location: location,
            login: login,
            level: level,
            email: email,
            projects_users: projects_users
            );

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}
