// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return Skill(
    json['id'] as int,
    json['name'] as String,
    (json['level'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
    };
