import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreInitial()) {
      on<NavigationscoreEvent>(navigationEvent);
  }

  FutureOr<void> navigationEvent(NavigationscoreEvent event, Emitter<ScoreState> emit) {
    emit (NavigationscoreState(index:event.index ));
  }
}
