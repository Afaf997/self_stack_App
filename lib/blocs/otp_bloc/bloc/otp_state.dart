part of 'otp_bloc.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
abstract class OtpActionstate extends OtpState{}

class forgotOtpteState extends OtpActionstate{}

class verifyState extends OtpState{}
