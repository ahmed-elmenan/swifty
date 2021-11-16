// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) {
  return StudentModel(
    imageUrl: json['imageUrl'] as String,
    correctionPoint: json['correctionPoint'] as String,
    wallet: json['wallet'] as String,
    cursusUsers: (json['cursusUsers'] as List)
        ?.map((e) =>
            e == null ? null : Cursus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usualFullName: json['usualFullName'] as String,
    location: json['location'] as String,
    login: json['login'] as String,
    level: json['level'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'level': instance.level,
      'usualFullName': instance.usualFullName,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'correctionPoint': instance.correctionPoint,
      'location': instance.location,
      'wallet': instance.wallet,
      'cursusUsers': instance.cursusUsers,
    };
