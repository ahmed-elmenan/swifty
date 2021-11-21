import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:swifty/core/utils/input_converter.dart';
import '../../../../core/error/error_utils.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/domain/entities/login_data.dart';
import '../../../login_data/domain/usecases/get_login_data.dart';

part 'login_data_event.dart';
part 'login_data_state.dart';

class LoginDataBloc extends Bloc<LoginDataEvent, LoginDataState> {
  final GetLoginData getLoginData;
  final InputConverter inputConverter;

  final Logger logger;

  LoginDataBloc(
      {@required this.inputConverter,
      @required this.logger,
      @required this.getLoginData})
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
      final inputEither = inputConverter.validateInputString(event.login);
      yield* inputEither.fold((failure) async* {
        yield LoginDataError(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (login) async* {
        yield LoginDataLoading();
        final loginDataOrFailure = await getLoginData(login, event.token);
        yield* loginDataOrFailure.fold((failure) async* {
          yield LoginDataError(
              message: ErrorUtils.mapFailureToMessage(failure));
        }, (loginData) async* {
          yield LoginDataLoaded(loginData: loginData);
        });
      });
    }
  }
}
