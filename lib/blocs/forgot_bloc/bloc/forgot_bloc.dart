import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/services/forgot_service.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final ForgotService forgotService = ForgotService();

  ForgotBloc() : super(ForgotInitial()) {
    on<ForgotScreenevent>(forgotevent);
    on<ForgotinitialEvent>(forgotinitialEvent);
    on<BackTosignUp>(backTosignUp);
  }

  FutureOr<void> forgotevent(ForgotScreenevent event, Emitter<ForgotState> emit) async {

    try {
      final success = await forgotService.forgotPassword(event.email);

      if (success) {
        emit(SuccessForgot());
      } else {
         emit(ForgotState .error("Invalid username or password. Please try again."));
      }
    } on Exception catch (e) {
      // ignore: unused_local_variable
      String errormessage = (e).toString();
      emit(ForgotState.error("An error occurred. Please try again later."));
    }
  }

  FutureOr<void> forgotinitialEvent(ForgotinitialEvent event, Emitter<ForgotState> emit) {
    emit(ForgotInitial());
  }

  FutureOr<void> backTosignUp(BackTosignUp event, Emitter<ForgotState> emit) {
    emit(BackToSignUpState());
  }
}


