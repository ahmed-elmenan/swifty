import 'dart:convert';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:swifty/core/consts/api_identifiers.dart';
import 'package:swifty/core/error/exceptions.dart';
import 'package:swifty/features/authentication/data/models/authorization_code_model.dart';
import 'package:swifty/features/authentication/data/models/token_model.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import '../../domain/entities/authorization_code.dart';

abstract class AuthRemoteDataSource {
  Future<AuthorizationCodeModel> getAuthorizationCode();
  Future<TokenModel> getToken(AuthorizationCode code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({@required this.client});
  @override
  Future<AuthorizationCodeModel> getAuthorizationCode() async {
    final result = await FlutterWebAuth.authenticate(
        url: _urlRefactor(), callbackUrlScheme: REDIRECT_SCHEME);
    return AuthorizationCodeModel(
        code: Uri.parse(result).queryParameters['code']);
  }

  @override
  Future<TokenModel> getToken(AuthorizationCode code) async {
    final response = await http.post(Uri.parse(TokenModel.authUrl),
        body: _requestBody(code.code));
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      return TokenModel.fromJson(parsedJson);
    } else {
      throw ServerException();
    }
  }

  String _urlRefactor() =>
      AuthorizationCodeModel.endpointUrl +
      '?' +
      Uri(queryParameters: AuthorizationCodeModel.queryParams).query;

  Map<String, dynamic> _requestBody(String code) => {
        'grant_type': 'authorization_code',
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_SECRET,
        'redirect_uri': 'ahelmen://app',
        'code': code,
        'state': '123',
      };
}
