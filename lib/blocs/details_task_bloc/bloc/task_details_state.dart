abstract class TaskDetailState {}

class InitialTaskDetailState extends TaskDetailState {}

class LoadingTaskDetailState extends TaskDetailState {}

class LoadedTaskDetailState extends TaskDetailState {
  final Map<String, dynamic> taskDetails;

  LoadedTaskDetailState({required this.taskDetails});
}

class ErrorTaskDetailState extends TaskDetailState {
  final String error;

  ErrorTaskDetailState({required this.error});
}