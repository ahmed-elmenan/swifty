// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) {
  return SkillModel(
    json['name'] as String,
    (json['level'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
    };
