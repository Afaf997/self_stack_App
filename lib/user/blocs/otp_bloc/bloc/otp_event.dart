part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}



// ignore: must_be_immutable
class OtpVerifyevent extends OtpEvent{
  String otp;
  String email;
  OtpVerifyevent({required this.email, required this.otp});
}
 class Backforgotevent extends OtpEvent{}