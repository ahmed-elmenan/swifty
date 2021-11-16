// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cursus _$CursusFromJson(Map<String, dynamic> json) {
  return Cursus(
    cursus: json['cursus'] == null
        ? null
        : CursusDetails.fromJson(json['cursus'] as Map<String, dynamic>),
    level: (json['level'] as num)?.toDouble(),
    skills: (json['skills'] as List)
        ?.map(
            (e) => e == null ? null : Skill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    grade: json['grade'],
  );
}

Map<String, dynamic> _$CursusToJson(Cursus instance) => <String, dynamic>{
      'grade': instance.grade,
      'level': instance.level,
      'skills': instance.skills,
      'cursus': instance.cursus,
    };
