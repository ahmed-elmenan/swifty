// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) {
  return LoginDataModel(
    image_url: json['image_url'] as String,
    correction_point: json['correction_point'] as int,
    wallet: json['wallet'] as int,
    cursus_users: (json['cursus_users'] as List)
        ?.map((e) =>
            e == null ? null : CursusModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    usual_full_name: json['usual_full_name'] as String,
    location: json['location'] as String,
    login: json['login'] as String,
    level: json['level'] as String,
    email: json['email'] as String,
    projects_users: (json['projects_users'] as List)
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
      'usual_full_name': instance.usual_full_name,
      'image_url': instance.image_url,
      'email': instance.email,
      'correction_point': instance.correction_point,
      'location': instance.location,
      'wallet': instance.wallet,
      'cursus_users': instance.cursus_users,
      'projects_users': instance.projects_users,
    };
