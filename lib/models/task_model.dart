import 'package:to_do/core/api_endpoints.dart';

class TaskModel {
  final String title;
  final bool status;

  TaskModel({required this.title, required this.status});

  factory TaskModel.fromJson(json) {
    return TaskModel(title: json[ApiKeys.title], status: json[ApiKeys.status]);
  }
}
