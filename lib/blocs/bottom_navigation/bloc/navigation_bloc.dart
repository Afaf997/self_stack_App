// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/blocs/bottom_navigation/bloc/navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
    int currentIndex = 0;
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToHomeEvent>(navigateToHomeEvent);
    on<NavigateToTaskEvent>(navigateToTaskEvent);
    on<NavigateToScheduleEvent>(navigateToScheduleEvent);
    on<NavigateToProfileEvent>(navigateToProfileEvent );
    on<LogoutEvent>(logoutEvent);
  }
   @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToHomeEvent) {
      yield HomeScreenState();
    } else if (event is NavigateToTaskEvent) {
      yield TaskScreenState();
    } else if (event is NavigateToScheduleEvent) {
      yield ScheduleScreenState();
    } else if (event is NavigateToProfileEvent) {
      yield ProfileScreenState();
    }
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

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<NavigationState> emit) {
    emit(LogoutState());
  }

    FutureOr<void> logoutState(LogoutState event, Emitter<NavigationState> emit) {
    emit(NavigationInitial());
  }

}
