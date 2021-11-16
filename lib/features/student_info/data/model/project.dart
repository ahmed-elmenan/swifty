import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  int id;
  String name;
  String slug;
  int parentId;

  Project({this.id, this.name, this.slug, this.parentId});

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}