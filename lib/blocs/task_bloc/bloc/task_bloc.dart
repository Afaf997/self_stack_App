import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskaNavigation>(taskaNavigation);
  }

  FutureOr<void> taskaNavigation(TaskaNavigation event, Emitter<TaskState> emit) {
    emit(navigateState());
  }
}
