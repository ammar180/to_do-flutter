import 'package:to_do/core/api_endpoints.dart';
import 'package:to_do/models/task_model.dart';

class UserModel {
  final int tasksCount;
  final int userId;
  final List<TaskModel> userTasks;

  UserModel({required this.tasksCount, required this.userId, required this.userTasks});

  factory UserModel.fromJson(dynamic userData,int id, List<TaskModel> tasks) {
    return UserModel(
      tasksCount: userData[ApiKeys.total],
      userId: id,
      userTasks: tasks);
  }

}
