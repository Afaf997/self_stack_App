import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial(tabIndex: 0)) {
    on<BottomNavigationBarEvent>((event, emit) {
      on<ChangeTabIndexEvent>(changeTabIndexEvent);
    });
  }

  FutureOr<void> changeTabIndexEvent(ChangeTabIndexEvent event, Emitter<BottomNavigationBarState> emit) {
    emit(BottomNavigationBarInitial(tabIndex: event.index));
  }
}
