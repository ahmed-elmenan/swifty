import 'package:swifty/core/network/network_info.dart';
import 'package:swifty/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/authentication/domain/entities/authorization_code.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:swifty/features/authentication/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, AuthorizationCode>> getAuthorizationCode() async {
    // TODO: implement getAuthorizationCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Token>> getToken(String code) {
    // TODO: implement getToken
    throw UnimplementedError();
  }
}
