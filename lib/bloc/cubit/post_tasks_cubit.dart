import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/data.dart';

import '../../main.dart';
import '../../presentation/presentation_widgets.dart';

part 'post_tasks_state.dart';

class PostTasksCubit extends Cubit<PostTasksState> {
  PostTasksCubit() : super(PostTasksInitial());

  final dataSource = sl.get<TasksDataSource>();

  void postTasks({required TaskModel taskModel}) async {
    try {
      emit(PostTasksLoading());

      await dataSource.postTasks(
        text: taskModel.text,
        time: taskModel.time,
        description: taskModel.description,
        priority: taskModel.priority,
        date: taskModel.date.toIso8601String(),
        title: taskModel.title,
      );

      emit(PostTasksLoaded());
    } on Exception catch (e) {
      emit(PostTasksError(errorMessage: e.toString()));
    }
  }
}
