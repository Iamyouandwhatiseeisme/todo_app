import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/data/get_it_methods.dart';
import 'package:todo_app/presentation/widgets/navigation/navigation_client.dart';

import 'presentation/presentation_widgets.dart';

final sl = GetIt.instance;

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: context.watch<ThemeProvider>().currentTheme == AppTheme.dark
              ? lightTheme
              : darkTheme,
          routes: sl.get<NavigatorClient>().routes,
        );
      }),
    );
  }
}
