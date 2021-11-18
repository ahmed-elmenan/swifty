import 'package:meta/meta.dart';
import 'package:swifty/features/student_info/data/model/project_details.dart';
import 'package:swifty/features/student_info/domain/entities/login_data.dart';

import 'cursus.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel extends LoginData {
  LoginDataModel(
      {@required String imageUrl,
      @required String correctionPoint,
      @required String wallet,
      @required List<Cursus> cursusUsers,
      @required String usualFullName,
      @required String location,
      @required String login,
      @required String level,
      @required String email,
      @required List<ProjectDetails> projectsUsers})
      : super(
          imageUrl: imageUrl,
          correctionPoint: correctionPoint,
          wallet: wallet,
          usualFullName: usualFullName,
          location: location,
          login: login,
          level: level,
          email: email
        );

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}
