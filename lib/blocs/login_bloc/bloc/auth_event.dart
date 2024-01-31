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

// ignore: must_be_immutable
class GoogleConnectEvent extends AuthEvent{
  String email;
  String displayName;
  String uid;
  String url;
  GoogleConnectEvent({required this.email,required this.displayName,required this.uid,required this.url});
}

class SignUpNavigationEvent extends AuthEvent{

}
