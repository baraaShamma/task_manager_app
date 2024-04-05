import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_app/features/tasks/data/models/tasks_model.dart';
import 'package:task_manager_app/link_api.dart';
import 'package:task_manager_app/resources/error/exceptions.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getAllTasks(idUser, limit);

  Future<Unit> deleteTask(int taskId);

  Future<Unit> updateTask(TaskModel taskModel);

  Future<Unit> addTask(TaskModel taskModel, idUsers);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final http.Client client;

  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TaskModel>> getAllTasks(idUser, limit) async {
    final response = await client.post(
      Uri.parse(AppLink.getTasksByUserId),
      body: {"id_users": idUser, "limit": limit},
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<TaskModel> taskModels = decodedJson
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();

      return taskModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addTask(TaskModel taskModel, idUsers) async {
    final body = {
      "title": taskModel.title,
      "body": taskModel.body,
      "id_users": idUsers
    };

    final response = await client.post(Uri.parse(AppLink.addTask), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteTask(int taskId) async {
    final response = await client.post(
      Uri.parse(AppLink.deleteTask),
      body: {"id": taskId},
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateTask(TaskModel taskModel) async {
    final taskId = taskModel.id.toString();
    final body = {
      "id": taskModel.id,
      "title": taskModel.title,
      "body": taskModel.body,
    };

    final response = await client.post(
      Uri.parse(AppLink.updateTask),
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
