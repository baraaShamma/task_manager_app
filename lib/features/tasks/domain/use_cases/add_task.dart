import 'package:dartz/dartz.dart';
import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';
import 'package:task_manager_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:task_manager_app/resources/error/failures.dart';

class AddTaskUseCase {
  final TasksRepository repository;

  AddTaskUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Tasks task,idUser) async {
    return await repository.addTask(task,idUser);
  }
}
