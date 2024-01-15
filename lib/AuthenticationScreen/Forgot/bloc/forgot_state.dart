part of 'forgot_bloc.dart';

@immutable
sealed class ForgotState {}

final class ForgotInitial extends ForgotState {}

 abstract class SignUpActionState extends ForgotState{} 


class ForgotScreenState extends ForgotState{}

class SuccessForgot extends SignUpActionState{}