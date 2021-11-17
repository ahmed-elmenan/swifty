// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return TokenModel(
    access_token: json['access_token'] as String,
    refresh_token: json['refresh_token'] as String,
    expires_in: json['expires_in'] as int,
    created_at: json['created_at'] as int,
  );
}

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'expires_in': instance.expires_in,
      'created_at': instance.created_at,
    };
