part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

 abstract class SignUpActionState extends SignUpState{} 

final class SignUpInitial extends SignUpState {}

class AuthLoading extends SignUpState{}

class AuthError extends SignUpState{}

class AuthLoaded extends SignUpState{}


class SignScreenActionState extends SignUpActionState{}

class LoginActionState  extends SignUpActionState{}

class SuccessState extends SignUpActionState {}

class AuthErrorstate extends  AuthActionState{}