import 'dart:convert';

import '../data.dart';
import 'package:http/http.dart' as http;

class TasksDataSource {
  final String targetUri = 'http://192.168.100.13:8080/tasks';
  Future<List<TaskModel>> fetchTasks() async {
    final url = Uri.parse(targetUri);

    // Replace with your server URL
    try {
      final response = await http.get(url);
      print(response);

      if (response.statusCode == 200) {
        final List<dynamic> taskList = jsonDecode(response.body);
        print(taskList.length);
        return taskList.map((json) => TaskModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch tasks');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<String> postTasks(
      {required String text,
      required String time,
      required String description,
      required String title,
      required int priority,
      required String date}) async {
    final url = Uri.parse(targetUri);

    Map<String, dynamic> requestBody = {
      "text": text,
      "time": time,
      "description": description,
      "title": title,
      "priority": priority,
      "date": date
    };

    // Replace with your server URL
    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(requestBody));
      print(response);

      if (response.statusCode == 200) {
        return 'Successfully posted tasks';
      } else {
        throw Exception('Failed to post tasks');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
