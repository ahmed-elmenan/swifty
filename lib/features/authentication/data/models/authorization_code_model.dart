

import 'package:flutter/cupertino.dart';
import '../../../../core/consts/api_identifiers.dart';
import '../../domain/entities/authorization_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_code_model.g.dart';

@JsonSerializable()
class AuthorizationCodeModel extends AuthorizationCode {
  static String authorizationEndPoint = 'oauth/authorize';
  static Map<String, String> queryParams = {
    'client_id': CLIENT_ID,
    'redirect_uri': REDIRECT_URI,
    'scope': 'public',
    'response_type': 'code',
    'state': '123',
  };

  AuthorizationCodeModel({
    @required String code
  }) : super(
    code: code
  );

  factory AuthorizationCodeModel.fromJson(Map<String, dynamic> json) => _$AuthorizationCodeModelFromJson(json);
}