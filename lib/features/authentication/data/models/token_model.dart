import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Token {
  static String authUrl = 'https://api.intra.42.fr/v2/oauth/token';
  
  TokenModel(
      {@required String accessToken,
      @required String refreshToken,
      @required DateTime expiresIn,
      @required DateTime createdAt})
      : super(
            accessToken: accessToken,
            refreshToken: refreshToken,
            expiresIn: expiresIn,
            createdAt: createdAt);

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
