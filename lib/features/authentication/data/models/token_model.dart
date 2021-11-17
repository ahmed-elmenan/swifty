import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Token {
  static String authUrl = 'https://api.intra.42.fr/v2/oauth/token';
  
  TokenModel(
      {@required String  access_token,
      @required String  refresh_token,
      @required int  expires_in,
      @required int  created_at})
      : super(
            access_token: access_token,
            refresh_token: refresh_token,
            expires_in: expires_in,
            created_at: created_at);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
