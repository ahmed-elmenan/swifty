import 'package:json_annotation/json_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel {
  final int id;
  final String name;
  final double level;


  SkillModel(this.id, this.name, this.level);

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);
}
