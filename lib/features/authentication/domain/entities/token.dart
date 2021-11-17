class Token {
  final String access_token;
  final String refresh_token;
  final int expires_in;
  final int created_at;

  Token({this.access_token, this.refresh_token, this.expires_in, this.created_at});

}
