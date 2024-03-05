abstract class TaskDetailsState {}

class TaskDetailsInitialState extends TaskDetailsState {}

class TaskDetailsLoadingState extends TaskDetailsState {}

class TaskDetailsLoadedState extends TaskDetailsState {
  final Map<String, dynamic> taskDetails;

  TaskDetailsLoadedState({required this.taskDetails});
}

class TaskDetailsErrorState extends TaskDetailsState {
  final String errorMessage;

  TaskDetailsErrorState({required this.errorMessage});
}
