// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailsModel _$ProjectDetailsModelFromJson(Map<String, dynamic> json) {
  return ProjectDetailsModel(
    id: json['id'] as int,
    occurrence: json['occurrence'] as int,
    final_mark: json['final_mark'] as int,
    status: json['status'] as String,
    validated: json['validated?'] as bool,
    current_team_id: json['current_team_id'] as int,
    project: json['project'] == null
        ? null
        : ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
    cursus_ids: (json['cursus_ids'] as List)?.map((e) => e as int)?.toList(),
    marked_at: json['marked_at'] as String,
    marked: json['marked'] as bool,
    retriable_at: json['retriable_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$ProjectDetailsModelToJson(
        ProjectDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'occurrence': instance.occurrence,
      'final_mark': instance.final_mark,
      'status': instance.status,
      'current_team_id': instance.current_team_id,
      'project': instance.project,
      'cursus_ids': instance.cursus_ids,
      'marked_at': instance.marked_at,
      'marked': instance.marked,
      'retriable_at': instance.retriable_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'validated?': instance.validated,
    };
