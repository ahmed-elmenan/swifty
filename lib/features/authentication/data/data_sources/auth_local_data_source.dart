import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../models/token_model.dart';
import 'package:meta/meta.dart';

abstract class AuthLocalDataSource {
  Future<TokenModel> getCachedTokenData();
  Future<void> cacheTokenData(TokenModel tokenModel);
}

const CACHED_TOKEN = 'CACHED_TOKEN';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<TokenModel> getCachedTokenData() {
    final jsonString = sharedPreferences.getString(CACHED_TOKEN);
    if (jsonString != null) {
      return Future.value(TokenModel.fromJson(json.decode(jsonString)));
    } else {
      return null;
      // throw CacheException();
    }
  }

  @override
  Future<void> cacheTokenData(TokenModel tokenModel) {
    return sharedPreferences.setString(
        CACHED_TOKEN, json.encode(tokenModel.toJson()));
  }
}
