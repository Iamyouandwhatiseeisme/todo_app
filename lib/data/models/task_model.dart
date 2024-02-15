// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final String id;
  String text;
  final String title;
  final String description;
  final String time;
  final int priority;
  bool completed;
  DateTime date;
  TaskModel(
      {required this.title,
      required this.description,
      required this.time,
      required this.priority,
      required this.id,
      required this.text,
      required this.completed,
      required this.date});
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'] as String,
        text: json['text'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        completed: json['completed'] as bool,
        time: json['time'] as String,
        priority: json['priority'] as int,
        date: DateTime.parse(json['date'] as String));
  }
}
