part of 'auth_bloc.dart';


@immutable
abstract class AuthState {
  static error(String ?e){
    log(e??"failed");
  }
  
}
 
 abstract class AuthActionState extends AuthState{} 

final class AuthInitial extends AuthState {}

class AuthErrorstate extends  AuthActionState{}

class LoginSuccessState extends AuthActionState{}

class SignScreenActionState extends AuthActionState{}

class ForgotActionState  extends AuthActionState{}

class googleAuthState extends AuthActionState{}

class GoogleSuccessState extends AuthActionState{}

class GoogleErrorstate extends  AuthActionState{}

class EmailValidationErrorState extends AuthState {
  final String errorMessage;
  EmailValidationErrorState(this.errorMessage);
}

class PasswordValidationErrorState extends AuthState {
  final String errorMessage;
  PasswordValidationErrorState(this.errorMessage);
}

class ServerErrorState extends AuthState {
  final String errorMessage;
  ServerErrorState(this.errorMessage);
}