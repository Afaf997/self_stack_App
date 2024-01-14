import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotInitial()) {
    on<ForgotEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
