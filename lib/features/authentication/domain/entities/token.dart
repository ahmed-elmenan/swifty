class Token {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresIn;
  final DateTime createdAt;

  Token({this.accessToken, this.refreshToken, this.createdAt, this.expiresIn});
}
