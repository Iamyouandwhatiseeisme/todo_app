import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bloc/cubit/cubits.dart';
import 'package:todo_app/bloc/cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/data/get_it_methods.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FetchTasksCubit()..fetchTasks(),
            ),
            BlocProvider(
              create: (context) => BottomNavigationBarCubit(),
            ),
            BlocProvider(
              create: (context) => PostTasksCubit(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: context.watch<ThemeProvider>().currentTheme == AppTheme.dark
                ? lightTheme
                : darkTheme,
            routes: sl.get<NavigatorClient>().routes,
          ),
        );
      }),
    );
  }
}
