import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'batch_event.dart';
part 'batch_state.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  BatchBloc() : super(BatchInitial()) {
      on<NavigationEvent>(navigationEvent);
     

  }

  FutureOr<void> navigationEvent(NavigationEvent event, Emitter<BatchState> emit) {
    emit(navigationState());
  }
}
