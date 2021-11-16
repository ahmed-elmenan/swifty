import 'cursus.dart';

import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel {
  final String login;
  final String level;
  final String usualFullName;
  final String imageUrl;
  final String email;
  final String correctionPoint;
  final String location;
  final String wallet;
  final List<Cursus> cursusUsers; 

  StudentModel({this.imageUrl, this.correctionPoint, this.wallet, this.cursusUsers, this.usualFullName, this.location, this.login, this.level, this.email});

  factory StudentModel.fromJson(Map<String, dynamic> json) => _$StudentModelFromJson(json);
}
