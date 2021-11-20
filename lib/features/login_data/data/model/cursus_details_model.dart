import 'package:json_annotation/json_annotation.dart';

part 'cursus_details_model.g.dart';

@JsonSerializable()
class CursusDetails {
  final int id;
  final String name;


  CursusDetails({this.id, this.name});

  factory CursusDetails.fromJson(Map<String, dynamic> json) => _$CursusDetailsFromJson(json);
}
