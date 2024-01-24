import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/data/get_it_methods.dart';
import 'package:todo_app/presentation/widgets/navigation/navigation_client.dart';

final sl = GetIt.instance;

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: sl.get<NavigatorClient>().routes,
    );
  }
}
