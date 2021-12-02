import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../login_data/data/model/project_model.dart';

part 'project_details_model.g.dart';

@JsonSerializable()
class ProjectDetailsModel {
  int id;
  int occurrence;
  int final_mark;
  String status;
  int current_team_id;
  ProjectModel project;
  List<int> cursus_ids;
  String marked_at;
  bool marked;
  String retriable_at;
  String created_at;
  String updated_at;

  @JsonKey(name: "validated?")
  bool validated;

  ProjectDetailsModel(
      {this.id,
      this.occurrence,
      this.final_mark,
      this.status,
      this.validated,
      this.current_team_id,
      this.project,
      this.cursus_ids,
      this.marked_at,
      this.marked,
      this.retriable_at,
      this.created_at,
      this.updated_at});

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsModelFromJson(json);
}
