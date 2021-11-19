// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailsModel _$ProjectDetailsModelFromJson(Map<String, dynamic> json) {
  return ProjectDetailsModel(
    id: json['id'] as int,
    occurrence: json['occurrence'] as int,
    finalMark: json['finalMark'] as int,
    status: json['status'] as String,
    validated: json['validated'] as bool,
    currentTeamId: json['currentTeamId'] as int,
    project: json['project'] == null
        ? null
        : ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
    cursusIds: (json['cursusIds'] as List)?.map((e) => e as int)?.toList(),
    markedAt: json['markedAt'] as String,
    marked: json['marked'] as bool,
    retriableAt: json['retriableAt'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ProjectDetailsModelToJson(
        ProjectDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'occurrence': instance.occurrence,
      'finalMark': instance.finalMark,
      'status': instance.status,
      'validated': instance.validated,
      'currentTeamId': instance.currentTeamId,
      'project': instance.project,
      'cursusIds': instance.cursusIds,
      'markedAt': instance.markedAt,
      'marked': instance.marked,
      'retriableAt': instance.retriableAt,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
