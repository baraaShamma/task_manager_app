

import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/auth/login/domain/entities/login.dart';
import 'package:task_manager_app/resources/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, Unit>> login(Login login);

}