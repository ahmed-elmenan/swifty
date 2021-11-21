import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'core/utils/input_converter.dart';
import 'features/login_data/domain/usecases/get_login_data.dart';

import 'core/network/network_info.dart';
import 'features/authentication/data/data_sources/auth_local_data_source.dart';
import 'features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/repositories/auth_repository.dart';
import 'features/authentication/domain/usecases/get_authorization_code.dart';
import 'features/authentication/domain/usecases/get_token.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/login_data/data/data_sources/login_data_remote_data_source.dart';
import 'features/login_data/data/repositories/get_login_repository_impl.dart';
import 'features/login_data/domain/repositories/login_data_repository.dart';
import 'features/login_data/presentation/bloc/login_data_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Authentication

  // BLoC
  sl.registerFactory(() => AuthenticationBloc(
      logger: sl(), getAuthorizationCode: sl(), getToken: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetAuthorizationCode(sl()));
  sl.registerLazySingleton(() => GetToken(sl()));

  // Repoitory
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  // Data
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  //! Features - Login Data
  // BLoC
  sl.registerFactory(() =>
      LoginDataBloc(inputConverter: sl(), logger: sl(), getLoginData: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetLoginData(sl()));

  // Repoitory
  sl.registerLazySingleton<LoginDataRepository>(
      () => LoginDataRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data
  sl.registerLazySingleton<LoginDataRemoteDataSource>(
      () => LoginDataRemoteDataSourceImpl(logger: sl(), client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InputConverter());
//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Logger());
}
