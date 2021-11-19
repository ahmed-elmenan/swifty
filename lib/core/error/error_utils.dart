import 'failure.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String AUTHORIZATION_FAILURE_MESSAGE = 'Authorization failure';
const String AUTHENTICATION_FAILURE_MESSAGE = 'Authentication failure';
const String NETWORK_FAILURE_MESSAGE = 'Network failure';
const String EMPTY_INPUT_FAILURE_MESSAGE = 'Empty Input - Enter a Valid Login';

class ErrorUtils {
  static String mapFailureToMessage(Failure failure) {
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
