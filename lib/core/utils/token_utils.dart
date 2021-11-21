import 'dart:convert';

import 'package:logger/logger.dart';

import '../../features/authentication/domain/entities/token.dart';

class TokenUtils {
  static bool checkAccessTokenExpiration(Token token) {
    
    Logger().d(json.encode(token));

    DateTime currentDate = DateTime.now();
    DateTime tokenCreationDate =
        DateTime.fromMillisecondsSinceEpoch(token.created_at * 1000);
    DateTime tokenExpirationDate =
        tokenCreationDate.add(Duration(seconds: token.expires_in));
    return tokenExpirationDate.isAfter(currentDate);
  }
}
