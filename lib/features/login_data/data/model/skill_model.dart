import 'package:json_annotation/json_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel {
  final String name;
  final double level;


  SkillModel(this.name, this.level);

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);
}
