abstract class TaskState {}

 abstract class TaskActionState extends TaskState{} 

final class TaskInitialState extends TaskState {}

class TaskLoadingState extends TaskState {}

class TaskLoadedState extends TaskState {
  final Map<String, dynamic> userDetails;

  TaskLoadedState(this.userDetails);
}

class TaskErrorState extends TaskState {
  final String errorMessage;

  TaskErrorState(this.errorMessage);
}

class navigationState  extends TaskActionState{}

class TaskNavigationState extends TaskActionState {
  final String taskId;
  final String courseId;

  TaskNavigationState({required this.taskId, required this.courseId});
}
