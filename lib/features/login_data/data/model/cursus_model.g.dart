// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursusModel _$CursusModelFromJson(Map<String, dynamic> json) {
  return CursusModel(
    cursus: json['cursus'] == null
        ? null
        : CursusDetails.fromJson(json['cursus'] as Map<String, dynamic>),
    level: (json['level'] as num)?.toDouble(),
    skills: (json['skills'] as List)
        ?.map((e) =>
            e == null ? null : SkillModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    grade: json['grade'],
  );
}

Map<String, dynamic> _$CursusModelToJson(CursusModel instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'level': instance.level,
      'skills': instance.skills,
      'cursus': instance.cursus,
    };
