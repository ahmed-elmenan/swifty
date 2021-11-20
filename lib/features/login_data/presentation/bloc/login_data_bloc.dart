import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import '../../../../core/error/error_utils.dart';
import '../../../authentication/domain/entities/token.dart';
import '../../../login_data/domain/entities/login_data.dart';
import '../../../login_data/domain/usecases/get_login_data.dart';

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
      yield LoginDataLoading();
      final loginDataOrFailure = await getLoginData(event.login, event.token);
      yield* loginDataOrFailure.fold((failure) async* {
        yield LoginDataError(message: ErrorUtils.mapFailureToMessage(failure));
      }, (loginData) async* {
        yield LoginDataLoaded(loginData: loginData);
      });
    }
  }
}
