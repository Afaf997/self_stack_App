part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

// ignore: must_be_immutable
class Loginevent extends AuthEvent{
  String email;
  String password;
  Loginevent({required this.email,required this.password});
}

class ForgotEvent extends AuthEvent{

}

class GoogleConnectEvent extends AuthEvent{

}

class SignUpNavigationEvent extends AuthEvent{

}
