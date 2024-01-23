import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToHomeEvent>(navigateToHomeEvent);
    on<NavigateToTaskEvent>(navigateToTaskEvent);
    on<NavigateToScheduleEvent>(navigateToScheduleEvent);
    on<NavigateToProfileEvent>(navigateToProfileEvent );
  
  }

  FutureOr<void> navigateToHomeEvent(NavigateToHomeEvent event, Emitter<NavigationState> emit) {
    emit( HomeScreenState());
  }

  FutureOr<void> navigateToTaskEvent(NavigateToTaskEvent event, Emitter<NavigationState> emit) {
    emit( TaskScreenState ());
  }

  FutureOr<void> navigateToScheduleEvent(NavigateToScheduleEvent event, Emitter<NavigationState> emit) {
    emit(ScheduleScreenState());
  }

  FutureOr<void> navigateToProfileEvent(NavigateToProfileEvent event, Emitter<NavigationState> emit) {
    emit(ProfileScreenState());
  }
}
