import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  int id;
  String name;
  String slug;
  int parent_id;

  ProjectModel({this.id, this.name, this.slug, this.parent_id});

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}