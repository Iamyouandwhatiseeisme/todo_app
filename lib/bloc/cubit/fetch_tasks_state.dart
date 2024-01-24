part of 'fetch_tasks_cubit.dart';


@immutable

sealed class FetchTasksState {

  List<Object> get props => [];

}


final class FetchTasksInitial extends FetchTasksState {}


final class FetchTasksLoading extends FetchTasksState {}


final class FetchTasksLoaded extends FetchTasksState {

  final List<TaskModel> listOfTasks;


  FetchTasksLoaded({required this.listOfTasks});


  @override

  List<Object> get props => [listOfTasks];

}


final class FetchTasksError extends FetchTasksState {

  final String errorMessage;


  FetchTasksError({required this.errorMessage});

}

