part of 'post_tasks_cubit.dart';

@immutable
sealed class PostTasksState {}

final class PostTasksInitial extends PostTasksState {}

final class PostTasksLoading extends PostTasksState {}

final class PostTasksLoaded extends PostTasksState {}

final class PostTasksError extends PostTasksState {
  final String errorMessage;

  PostTasksError({required this.errorMessage});
}
