part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}


class LoadTaskEvent extends TaskEvent {}


class NavigateToDetailEvent extends TaskEvent {
  final String taskId;
  final String courseId;

  NavigateToDetailEvent({required this.taskId, required this.courseId});
}
