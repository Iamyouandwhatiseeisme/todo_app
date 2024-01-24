import 'dart:convert';

import '../data.dart';
import 'package:http/http.dart' as http;

class TasksDataSource {
  Future<List<TaskModel>> fetchTasks() async {
    final url = Uri.parse('http://192.168.100.9:8080/tasks');
    print(url);
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
}
