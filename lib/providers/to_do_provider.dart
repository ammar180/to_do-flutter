import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/dio_consumer.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/services/task_service.dart';

class ToDoProvider extends ChangeNotifier {
  var userService = TaskService(api: DioConsumer(dio: Dio()));
  UserModel? user;
  TaskModel? addedTasks;

  Future<List<TaskModel>> featchUserTasks(id) async {
    user = await userService.getTasks(id);
    user!.userTasks.add(addedTasks!);
    return user!.userTasks;
  }

  handleAddingTask(String taskTitle) {
    addedTasks = TaskModel(title: taskTitle, status: false);

    notifyListeners();
  }
}
