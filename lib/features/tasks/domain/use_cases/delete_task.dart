import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:task_manager_app/resources/error/failures.dart';


class DeleteTaskUseCase {
  final TasksRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int taskId) async {
    return await repository.deleteTask(taskId);
  }
}
