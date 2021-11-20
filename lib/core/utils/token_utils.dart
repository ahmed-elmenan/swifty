import '../../features/authentication/domain/entities/token.dart';

class TokenUtils {
  static bool checkAccessTokenExpiration(Token token) {
    DateTime currentDate = DateTime.now();
    DateTime tokenCreationDate =
        DateTime.fromMillisecondsSinceEpoch(token.created_at * 1000);
    DateTime tokenExpirationDate =
        tokenCreationDate.add(Duration(seconds: token.expires_in));

    return tokenExpirationDate.isBefore(currentDate);
  }
}

    // print("tokenCreationDate" + tokenCreationDate.toString());
    // print("tokenExpirationDate" + tokenExpirationDate.toString());