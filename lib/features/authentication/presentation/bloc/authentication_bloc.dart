import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swifty/core/error/failure.dart';

import '../../domain/entities/token.dart';
import '../../domain/usecases/get_authorization_code.dart';
import '../../domain/usecases/get_token.dart';
import 'package:logger/logger.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'Authorization failure';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Authentication failure';
const String NETWORK_FAILURE_MESSAGE = 'Network failure';
const String EMPTY_INPUT_FAILURE_MESSAGE = 'Empty Input - Enter a Valid Login';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetAuthorizationCode getAuthorizationCode;
  final GetToken getToken;
  final Logger logger;

  AuthenticationBloc( 
      {this.logger, @required this.getAuthorizationCode, @required this.getToken})
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
        yield Error(message: _mapFailureToMessage(failure));
      }, (code) async* {
        final failureOrCode = await getToken(code);
        yield failureOrCode
            .fold((failure) => Error(message: _mapFailureToMessage(failure)), (token) {
          return Authenticated(token: token);
        });
      });
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NetworkFailure:
        return NETWORK_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }
}
