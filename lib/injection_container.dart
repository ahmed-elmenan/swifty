import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/get_authorization_code.dart';
import 'features/authentication/domain/usecases/get_token.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Authentication

  // BLoC
  sl.registerFactory(
      () => AuthenticationBloc(logger: Logger(), getAuthorizationCode: sl(), getToken: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetAuthorizationCode(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));

  // Repoitory
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
