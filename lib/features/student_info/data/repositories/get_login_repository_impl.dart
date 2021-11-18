import 'package:swifty/core/network/network_info.dart';
import 'package:swifty/core/utils/token_utils.dart';
import 'package:swifty/features/student_info/data/data_sources/login_data_remote_data_source.dart';
import 'package:swifty/features/student_info/domain/entities/login_data.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:swifty/features/student_info/domain/repositories/login_data_repository.dart';

class LoginDataRepositoryImpl implements LoginDataRepository {
  final LoginDataRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginDataRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, LoginData>> getLoginData(
      String login, Token token) async {
    if (await networkInfo.isConnected) {
      if (TokenUtils.checkAccessTokenExpiration(token)) {
        final loginData = await remoteDataSource.getStudentData(login, token);
        return (Right(loginData));
      } else {
        return Left(TokenExpirationFailure());
      }
    } else {
      {
        return Left(NetworkFailure());
      }
    }
  }
}
