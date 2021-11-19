
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swifty/features/student_info/data/model/project_model.dart';

part 'project_details_model.g.dart';

@JsonSerializable()
class ProjectDetailsModel {
  int id;
  int occurrence;
  int finalMark;
  String status;
  bool validated;
  int currentTeamId;
  ProjectModel project;
  List<int> cursusIds;
  String markedAt;
  bool marked;
  String retriableAt;
  String createdAt;
  String updatedAt;

  ProjectDetailsModel({
      this.id,
      this.occurrence,
      this.finalMark,
      this.status,
      this.validated,
      this.currentTeamId,
      this.project,
      this.cursusIds,
      this.markedAt,
      this.marked,
      this.retriableAt,
      this.createdAt,
      this.updatedAt
  });

  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) => _$ProjectDetailsModelFromJson(json);
}