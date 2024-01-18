part of 'forgot_bloc.dart';

@immutable
sealed class ForgotState {
   static error(String ?e){
    log(e??"gfd");
  }
}

final class ForgotInitial extends ForgotState {}

 abstract class SignUpActionState extends ForgotState{} 


class ForgotScreenState extends ForgotState{}

class SuccessForgot extends SignUpActionState{}

class BackToSignUpState extends SignUpActionState{}