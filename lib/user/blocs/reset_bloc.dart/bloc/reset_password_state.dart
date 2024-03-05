part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {
   static error(String ?e){
    log(e??"gfd");
  }
}

final class ResetPasswordInitial extends ResetPasswordState {}

abstract class ResetActionstate extends ResetPasswordState{}

class SuccessResetState extends  ResetActionstate{}

class ResetNavigateState extends ResetActionstate{}
