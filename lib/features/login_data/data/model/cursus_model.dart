import 'package:json_annotation/json_annotation.dart';
import '../../../login_data/data/model/skill_model.dart';

import 'cursus_details_model.dart';

part 'cursus_model.g.dart';

@JsonSerializable()
class CursusModel {
  final dynamic grade;
  final double level;
  final List<SkillModel> skills;
  final CursusDetails cursus;

  CursusModel({this.cursus, this.level, this.skills, this.grade});

  factory CursusModel.fromJson(Map<String, dynamic> json) =>
      _$CursusModelFromJson(json);
}
