import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';

class InputConverter {
  Either<Failure, String> validateInputString(String str) {
    try {
      final convertedStr = str.toLowerCase().trim();
      print(convertedStr);
      if (convertedStr.length <= 0) throw FormatException();
      return Right(convertedStr);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
