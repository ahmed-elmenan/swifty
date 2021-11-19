import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:swifty/core/error/error_utils.dart';
import 'package:swifty/features/authentication/domain/entities/token.dart';
import 'package:swifty/features/student_info/domain/entities/login_data.dart';
import 'package:swifty/features/student_info/domain/usecases/get_login_data.dart';

part 'login_data_event.dart';
part 'login_data_state.dart';

class LoginDataBloc extends Bloc<LoginDataEvent, LoginDataState> {
  final GetLoginData getLoginData;
  final Logger logger;

  LoginDataBloc({@required this.getLoginData, this.logger})
      : super(LoginDataStateInitial());

  @override
  void onEvent(LoginDataEvent event) {
    logger?.d(event.toString());
    super.onEvent(event);
  }

  @override
  void onChange(Change<LoginDataState> change) {
    logger?.d(change.nextState.toString());
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger?.e(error);
    super.onError(error, stackTrace);
  }

  @override
  Stream<LoginDataState> mapEventToState(LoginDataEvent event) async* {
    if (event is FetchLoginData) {
      yield Loading();
      final loginDataOrFailure = await getLoginData(event.login, event.token);
      yield* loginDataOrFailure.fold((failure) async* {
        yield Error(message: ErrorUtils.mapFailureToMessage(failure));
      }, (loginData) async* {
        yield Loaded(loginData: loginData);
      });
    }
  }
}
