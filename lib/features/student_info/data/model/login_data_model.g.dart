// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) {
  return LoginDataModel(
    imageUrl: json['imageUrl'] as String,
    correctionPoint: json['correctionPoint'] as String,
    wallet: json['wallet'] as String,
    cursusUsers: (json['cursusUsers'] as List)
        ?.map((e) =>
            e == null ? null : CursusModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usualFullName: json['usualFullName'] as String,
    location: json['location'] as String,
    login: json['login'] as String,
    level: json['level'] as String,
    email: json['email'] as String,
    projectsUsers: (json['projectsUsers'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectDetailsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
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
      'projectsUsers': instance.projectsUsers,
    };
