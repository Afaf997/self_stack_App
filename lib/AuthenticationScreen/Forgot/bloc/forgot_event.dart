part of 'forgot_bloc.dart';

@immutable
sealed class ForgotEvent {}

class BuildForgotEvent extends ForgotEvent{}

 class ForgotinitialEvent extends ForgotEvent{}
// ignore: must_be_immutable
class ForgotScreenevent extends ForgotEvent{

  String email;

  ForgotScreenevent({required this.email});
}
