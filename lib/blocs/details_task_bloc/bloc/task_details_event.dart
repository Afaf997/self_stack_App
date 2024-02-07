abstract class TaskDetailsEvent {}

class FetchTaskDetailsEvent extends TaskDetailsEvent {
  final String taskId;
  final String courseId;

  FetchTaskDetailsEvent({required this.taskId, required this.courseId});
}
