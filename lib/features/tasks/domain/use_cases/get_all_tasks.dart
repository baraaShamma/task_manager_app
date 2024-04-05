import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';
import 'package:task_manager_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:task_manager_app/resources/error/failures.dart';

class GetAllTasksUseCase {
  final TasksRepository repository;

  GetAllTasksUseCase(this.repository);

  Future<Either<Failure, List<Tasks>>> call(idUser,limit) async {
    return await repository.getAllTasks(idUser,limit);
  }
}
