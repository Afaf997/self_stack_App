part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

abstract class  TaskActionstate extends TaskState{}

class navigateState extends TaskActionstate{}
