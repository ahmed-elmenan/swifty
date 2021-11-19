import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  int id;
  String name;
  String slug;
  int parentId;

  ProjectModel({this.id, this.name, this.slug, this.parentId});

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}