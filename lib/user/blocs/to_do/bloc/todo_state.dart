part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
abstract class todoActionState extends TodoState{}

class RefreshState extends TodoState{
  Future<List<TodoModel>> todoListFuture;
  RefreshState(this.todoListFuture);
}

class NavigationTodoState extends todoActionState{}
 