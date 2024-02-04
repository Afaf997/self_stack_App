

// Event
abstract class TaskDetailEvent {}

class FetchTaskDetailEvent extends TaskDetailEvent {
  final String taskId;
  final String courseId;

  FetchTaskDetailEvent({required this.taskId, required this.courseId});
}