import 'package:dartz/dartz.dart';
import 'package:swifty/core/error/failure.dart';
import 'package:swifty/features/student_info/domain/entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, Student>> getStudentInfo();
}

