import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/data/data_sources/task_local_data_source.dart';
import 'package:task_manager_app/features/tasks/data/data_sources/task_remote_data_source.dart';
import 'package:task_manager_app/features/tasks/data/models/tasks_model.dart';
import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';
import 'package:task_manager_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:task_manager_app/resources/error/exceptions.dart';
import 'package:task_manager_app/resources/error/failures.dart';
import 'package:task_manager_app/resources/network/network_info.dart';

typedef DeleteOrUpdateOrAddTask = Future<Unit> Function();


class TasksRepositoryImpl implements TasksRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TasksRepositoryImpl(
      {required this.remoteDataSource,
        required this.localDataSource,
        required this.networkInfo});
  @override
  Future<Either<Failure, List<Tasks>>> getAllTasks(idUser,limit) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getAllTasks(idUser,limit);
        localDataSource.cacheTasks(remoteTasks);
        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getCachedTasks();
        return Right(localTasks);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addTask(Tasks tasks,idUser) async {
    final TaskModel taskModel = TaskModel(title: tasks.title, body: tasks.body);
    return await _getMessage(() {
      return remoteDataSource.addTask(taskModel,idUser);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(int taskId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteTask(taskId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateTask(Tasks tasks) async {
    final TaskModel taskModel =
    TaskModel(id: tasks.id, title: tasks.title, body: tasks.body);

    return await _getMessage(() {
      return remoteDataSource.updateTask(taskModel);
    });
  }


  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddTask deleteOrUpdateOrAddTask) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddTask();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
