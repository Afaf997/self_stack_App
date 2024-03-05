import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/user/blocs/task_bloc/bloc/task_state.dart';
import 'package:self_stack/user/pages/dashboard_screen/task/function/task_function.dart';
import 'package:self_stack/user/repository/shared_preference.dart';


part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitialState()) {
    on<NavigateToDetailEvent>(navigateToDetailEvent);
    on<LoadTaskEvent>(loadTaskEvent);
  }


  FutureOr<void> loadTaskEvent(LoadTaskEvent event, Emitter<TaskState> emit) async{
      if (event is LoadTaskEvent) {
    emit(TaskLoadingState());
    try {
        String? userId = await getUserId();
        if (userId != null) {
          Map<String, dynamic> userDetails = await fetchtaskDetails(userId);
          emit(TaskLoadedState(userDetails));
        } else {
          emit(TaskErrorState('User not logged in'));
        }
      } catch (e) {
        emit(TaskErrorState('Error loading tasks: $e'));
      }
      }
  }

  FutureOr<void> navigateToDetailEvent(NavigateToDetailEvent event, Emitter<TaskState> emit) {
    emit(TaskNavigationState(taskId: event.taskId, courseId: event.courseId));
  }
}