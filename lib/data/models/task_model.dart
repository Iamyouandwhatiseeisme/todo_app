// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final String id;
  final String text;
  bool completed;
  TaskModel({
    required this.id,
    required this.text,
    required this.completed,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      text: json['text'] as String,
      completed: json['completed'] as bool,
    );
  }
}
