import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/error_utils.dart';
import '../../../../core/error/failure.dart';

import '../../domain/entities/token.dart';
import '../../domain/usecases/get_authorization_code.dart';
import '../../domain/usecases/get_token.dart';
import 'package:logger/logger.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetAuthorizationCode getAuthorizationCode;
  final GetToken getToken;
  final Logger logger;

  AuthenticationBloc(
      {this.logger,
      @required this.getAuthorizationCode,
      @required this.getToken})
      : super(AuthenticationInitial());

  @override
  void onEvent(AuthenticationEvent event) {
    logger?.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<AuthenticationState> change) {
    logger?.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger?.e(error);
    super.onError(error, stackTrace);
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticateUser) {
      yield Loading();
      final authorizationCode = await getAuthorizationCode();
      yield* authorizationCode.fold((failure) async* {
        yield Error(message: ErrorUtils.mapFailureToMessage(failure));
      }, (code) async* {
        final failureOrCode = await getToken(code);
        yield failureOrCode.fold(
            (failure) =>
                Error(message: ErrorUtils.mapFailureToMessage(failure)),
            (token) {
          return Authenticated(token: token);
        });
      });
    }
  }
}
