

import 'package:task_manager_app/features/tasks/domain/entities/tasks.dart';

class TaskModel extends Tasks {
  const TaskModel({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
