import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/features/tasks/data/models/tasks_model.dart';
import 'package:task_manager_app/resources/error/exceptions.dart';


abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getCachedTasks();
  Future<Unit> cacheTasks(List<TaskModel> taskModels);
}

const CACHED_TASKS = "CACHED_TASKS";

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheTasks(List<TaskModel> taskModel) {
    List taskModelsToJson = taskModel
        .map<Map<String, dynamic>>((taskModel) => taskModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_TASKS, json.encode(taskModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<TaskModel>> getCachedTasks() {
    final jsonString = sharedPreferences.getString(CACHED_TASKS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<TaskModel> jsonToTaskModels = decodeJsonData
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();
      return Future.value(jsonToTaskModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
