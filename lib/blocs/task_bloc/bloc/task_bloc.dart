import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskNavigation>(taskaNavigation);
  }

  FutureOr<void> taskaNavigation(TaskNavigation event, Emitter<TaskState> emit) {
    emit(navigateState());
  }
}
