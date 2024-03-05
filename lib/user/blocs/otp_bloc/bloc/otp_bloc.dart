import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/user/services/otp_service.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpService otpService = OtpService();

  OtpBloc() : super(OtpInitial()) {
    on<OtpVerifyevent>(otpVerifyEvent);
    on<Backforgotevent >(backForgotEvent);
  }

  FutureOr<void> otpVerifyEvent(OtpVerifyevent event, Emitter<OtpState> emit) async {
    // emit(OtpLoading());

    try {
      final success = await otpService.verifyOTP(event.email, event.otp);

      if (success) {
        emit(SuccessOtpState());
      } else {
       emit(OtpState.error("Invalid otp Please try again."));
      }
    }  on Exception catch (e) {
      // ignore: unused_local_variable
      String errormessage = (e).toString();
      emit(OtpState.error("An error occurred. Please try again later."));
    }
  }

  FutureOr<void> backForgotEvent(Backforgotevent  event, Emitter<OtpState> emit) {
    emit(NavigateState());
  }
}
