import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:swifty/core/consts/api_identifiers.dart';
import 'package:swifty/core/error/exceptions.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/core/utils/token_utils.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/student_info/data/model/login_data_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataRemoteDataSource {
  Future<LoginDataModel> getStudentData(String login, Token token);
}

class LoginDataRemoteDataSourceImpl implements LoginDataRemoteDataSource {
  final http.Client client;
  Logger logger;

  LoginDataRemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginDataModel> getStudentData(String login, Token token) async {
    final header = {
      'Authorization': 'Bearer ${token.access_token}',
    };
    final response = await http.get(Uri.parse(API_URL + token.access_token),
        headers: header);
    if (response.statusCode == 200) {
      // convert data from json logic here
      final parsedJson = json.decode(response.body);
      final loginData = LoginDataModel.fromJson(parsedJson);
      return loginData;
    } else {
      throw ServerException();
    }
  }
}
