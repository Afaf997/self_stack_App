import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/response/todo_model.dart';
import 'package:self_stack/services/todo_get_service.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

final GetTodoServices getTaskDetailsService = GetTodoServices();

  TodoBloc() : super(TodoInitial()) {
    on<RefreshEvent>(refreshEvent);
  }

  FutureOr<void> refreshEvent(RefreshEvent event, Emitter<TodoState> emit) {
      Future<List<TodoModel>> todoListFuture= getTaskDetailsService.GetTodogetDetails();
    emit(RefreshState(todoListFuture));
  }
}
