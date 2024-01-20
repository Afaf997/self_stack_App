part of 'otp_bloc.dart';

@immutable
// sealed class OtpState {}
sealed class OtpState {
   static error(String ?e){
    log(e??"gfd");
  }
}

final class OtpInitial extends OtpState {}
abstract class OtpActionstate extends OtpState{}

// class forgotOtpteState extends OtpActionstate{}

class verifyState extends OtpState{}

class SuccessOtpState extends  OtpActionstate{}

