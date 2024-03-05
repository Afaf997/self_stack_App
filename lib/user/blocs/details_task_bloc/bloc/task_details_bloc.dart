import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/user/blocs/details_task_bloc/bloc/task_details_event.dart';
import 'package:self_stack/user/blocs/details_task_bloc/bloc/task_details_state.dart';
import 'package:self_stack/user/services/get_details_task_service.dart';


class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  final getTaskDetailsServices getTaskDetailsService = getTaskDetailsServices();

  TaskDetailsBloc() : super(TaskDetailsInitialState());

  @override
  Stream<TaskDetailsState> mapEventToState(TaskDetailsEvent event) async* {
    if (event is FetchTaskDetailsEvent) {
      yield TaskDetailsLoadingState();
      try {
        Map<String, dynamic> taskDetails =
            await getTaskDetailsService.getDetails(event.taskId, event.courseId);
        yield TaskDetailsLoadedState(taskDetails: taskDetails);
      } catch (error) {
        yield TaskDetailsErrorState(errorMessage: 'Error fetching task details');
      }
    }
  }
}
