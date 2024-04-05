import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';
import 'package:task_manager_app/resources/error/failures.dart';


abstract class TasksRepository {
  Future<Either<Failure, List<Tasks>>> getAllTasks(idUser,limit);
  Future<Either<Failure, Unit>> deleteTask(int id);
  Future<Either<Failure, Unit>> updateTask(Tasks tasks);
  Future<Either<Failure, Unit>> addTask(Tasks tasks,idUser);
}
