part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  static error(String ?e){
    log(e??"gfd");
  }
}
 
 abstract class AuthActionState extends AuthState{} 

final class AuthInitial extends AuthState {}

class AuthLoadingstate extends AuthState{}

class AuthErrorstate extends  AuthActionState{}

class AuthLoadedstate extends AuthState{}

class LoginSuccessState extends AuthActionState{}


class SignScreenActionState extends AuthActionState{}

class ForgotActionState  extends AuthActionState{}

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