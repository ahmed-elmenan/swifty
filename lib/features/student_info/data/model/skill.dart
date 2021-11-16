import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill {
  final int id;
  final String name;
  final double level;


  Skill(this.id, this.name, this.level);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
