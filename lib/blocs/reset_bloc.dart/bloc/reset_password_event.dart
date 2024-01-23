// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

// ignore: must_be_immutable
class Submitevent extends ResetPasswordEvent {
    String email;
    String newpassword;
  Submitevent({required this.email,required this.newpassword});
}

class BackToOtp extends ResetPasswordEvent{}
