import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/auth/login/data/datasources/login_remote.dart';
import 'package:task_manager_app/features/auth/login/domain/entities/login.dart';
import 'package:task_manager_app/features/auth/login/domain/repositories/login_repository.dart';
import 'package:task_manager_app/resources/error/exceptions.dart';
import 'package:task_manager_app/resources/error/failures.dart';
import 'package:task_manager_app/resources/network/network_info.dart';

typedef LoginPost = Future<Unit> Function();


class LoginRepositoryImpl implements LoginRepository {
  final LoginRemote loginRemote;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.loginRemote,
        required this.networkInfo});
 

  @override
  Future<Either<Failure, Unit>> login(Login login) async {
    return await _getMessage(() {
      return loginRemote.login(login.email , login.password);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      LoginPost loginPost) async {
    if (await networkInfo.isConnected) {
      try {
        await loginPost();
        return const Right(unit);
      }
      on WrongDataFailureException{
        return Left(WrongDataFailure());
      }
      on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }


}
