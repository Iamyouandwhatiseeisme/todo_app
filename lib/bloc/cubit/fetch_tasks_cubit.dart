import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:todo_app/data/data.dart';

import 'package:todo_app/data/remote_data_source/tasks_data_source.dart';

import 'package:todo_app/main.dart';

part 'fetch_tasks_state.dart';

class FetchTasksCubit extends Cubit<FetchTasksState> {
  FetchTasksCubit() : super(FetchTasksInitial());

  final dataSource = sl.get<TasksDataSource>();

  void fetchTasks() async {
    try {
      emit(FetchTasksLoading());

      final fetchedTasksList = await dataSource.fetchTasks();

      emit(FetchTasksLoaded(listOfTasks: fetchedTasksList));
    } on Exception catch (e) {
      emit(FetchTasksError(errorMessage: e.toString()));
    }
  }

  void checkUpdated() async {
    emit(FetchTasksUpdated());
  }
}
