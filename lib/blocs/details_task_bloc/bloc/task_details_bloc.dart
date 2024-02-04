import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:self_stack/blocs/details_task_bloc/bloc/task_details_event.dart';
import 'package:self_stack/blocs/details_task_bloc/bloc/task_details_state.dart';
import 'package:self_stack/services/get_details_task_service.dart';
import 'package:self_stack/services/get_details_task_service.dart';


class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final getTaskDetailsServices getTaskdetailsService = getTaskDetailsServices();

  TaskDetailBloc() : super(InitialTaskDetailState());

  @override
  Stream<TaskDetailState> mapEventToState(TaskDetailEvent event) async* {
    if (event is FetchTaskDetailEvent) {
      yield LoadingTaskDetailState();

      try {
        Map<String, dynamic> taskDetails =
            await getTaskdetailsService.getDetails(event.taskId, event.courseId);
        yield LoadedTaskDetailState(taskDetails: taskDetails);
      } catch (error) {
        yield ErrorTaskDetailState(error: 'Error fetching task details: $error');
      }
    }
  }
}
