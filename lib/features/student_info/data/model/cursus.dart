import 'package:json_annotation/json_annotation.dart';
import 'package:swifty/features/student_info/data/model/skill.dart';

import 'cursus_details.dart';

part 'cursus.g.dart';

@JsonSerializable()
class Cursus {
  final dynamic grade;
  final double level;
  final List<Skill> skills;
  final CursusDetails cursus;
  
  Cursus({this.cursus, this.level, this.skills, this.grade});

  factory Cursus.fromJson(Map<String, dynamic> json) => _$CursusFromJson(json);
}
