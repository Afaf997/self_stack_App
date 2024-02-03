import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_details_event.dart';
part 'task_details_state.dart';

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  TaskDetailsBloc() : super(TaskDetailsInitial()) {
    on<TaskDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
