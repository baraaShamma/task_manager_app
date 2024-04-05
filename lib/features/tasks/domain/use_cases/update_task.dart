import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';
import 'package:task_manager_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:task_manager_app/resources/error/failures.dart';

class UpdateTaskUseCase {
  final TasksRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Tasks tasks) async {
    return await repository.updateTask(tasks);
  }
}
