
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/token.dart';
import '../../domain/usecases/get_authorization_code.dart';
import '../../domain/usecases/get_token.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetAuthorizationCode getAuthorizationCode;
  final GetToken getToken;

  AuthenticationBloc(
      {@required this.getAuthorizationCode, @required this.getToken})
      : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticateUser) {
      yield Loading();
      final authorizationCode = await getAuthorizationCode();
      yield* authorizationCode.fold((failure) async* {
        yield Error(message: "authorization error");
      }, (code) async* {
        final failureOrCode = await getToken(code);
        yield failureOrCode.fold(
            (failure) => Error(message: "authentication error"),
            (token) => Authenticated(token: token));
      });
    }
  }
}
