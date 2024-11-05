import 'package:to_do/core/api_consumer.dart';
import 'package:to_do/core/api_endpoints.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/models/user_model.dart';

class TaskService {
  final ApiConsumer api;
  TaskService({required this.api});

  Future<UserModel> getTasks(int userId) async {
    final result = await api.get('${ApiEndpoints.getTasks}/$userId');
    final count = result[ApiKeys.total];
    final List<TaskModel> tasks = List.empty(growable: true);
    for (var i = 0; i < count; i++) {
      tasks.add(TaskModel.fromJson(result[ApiKeys.todos][i]));
    }

    final user = UserModel(tasksCount: count, userId: userId, userTasks: tasks);
    return user;
  }

  postTask(TaskModel? addedTasks) async {
    if (addedTasks == null) return;
    await api.post(ApiEndpoints.getTasks, data: addedTasks);
  }
}
