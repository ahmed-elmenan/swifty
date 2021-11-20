import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../../../../core/consts/api_identifiers.dart';
import '../../../../core/error/exceptions.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/data/model/login_data_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataRemoteDataSource {
  Future<LoginDataModel> getStudentData(String login, Token token);
}

class LoginDataRemoteDataSourceImpl implements LoginDataRemoteDataSource {
  final http.Client client;
  final Logger logger;

  LoginDataRemoteDataSourceImpl({@required this.logger, @required this.client});

  @override
  Future<LoginDataModel> getStudentData(String login, Token token) async {
    final header = {
      'Authorization': 'Bearer ${token.access_token}',
    };
    final response = await http.get(
        Uri.parse(API_URL + LoginDataModel.usersEndPoint + login),
        headers: header);
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      // logger.d(parsedJson);
      final loginData = LoginDataModel.fromJson(parsedJson);
      return loginData;
    } else {
      throw ServerException();
    }
  }
}
