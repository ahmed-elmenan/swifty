
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swifty/features/student_info/data/model/project.dart';

part 'project_details.g.dart';

@JsonSerializable()
class ProjectDetails {
  int id;
  int occurrence;
  int finalMark;
  String status;
  bool validated;
  int currentTeamId;
  Project project;
  List<int> cursusIds;
  String markedAt;
  bool marked;
  String retriableAt;
  String createdAt;
  String updatedAt;

  ProjectDetails({
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

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => _$ProjectDetailsFromJson(json);
}