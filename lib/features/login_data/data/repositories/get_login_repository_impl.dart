import 'package:swifty/core/error/exceptions.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/token_utils.dart';
import '../../../login_data/data/data_sources/login_data_remote_data_source.dart';
import '../../../login_data/domain/entities/login_data.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../login_data/domain/repositories/login_data_repository.dart';

class LoginDataRepositoryImpl implements LoginDataRepository {
  final LoginDataRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginDataRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, LoginData>> getLoginData(
      String login, Token token) async {
    try {
      if (await networkInfo.isConnected) {
        if (TokenUtils.checkAccessTokenExpiration(token)) {
          final loginData = await remoteDataSource.getStudentData(login, token);
          return (Right(loginData));
        } else {
          return Left(TokenExpirationFailure());
        }
      } else {
        return Left(NetworkFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } on LoginNotFoundException{
      return Left(LoginNotFoundFailure());
    }
  }
}
