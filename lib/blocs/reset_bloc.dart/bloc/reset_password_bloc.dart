import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/services/reset_service.dart';


part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordService _resetPasswordService = ResetPasswordService();

  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<Submitevent>(_submitEvent);
    on<BackToOtp>(_backToOtp);
  }

  FutureOr<void> _submitEvent(Submitevent event, Emitter<ResetPasswordState> emit) async {
    try {
      await _resetPasswordService.submitResetRequest(event.email, event.newpassword);
      emit(SuccessResetState());
    } catch (e) {
      emit(ResetPasswordState.error("An error occurred. Please try again."));
    }
  }

  FutureOr<void> _backToOtp(BackToOtp event, Emitter<ResetPasswordState> emit) {
    emit(ResetNavigateState());
  }
}

