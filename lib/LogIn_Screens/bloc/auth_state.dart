part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}
 
 abstract class AuthActionState extends AuthState{} 

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthError extends AuthState{}

class AuthLoaded extends AuthState{}


class SignScreenActionState extends AuthActionState{}

class ForgotActionState  extends AuthActionState{}