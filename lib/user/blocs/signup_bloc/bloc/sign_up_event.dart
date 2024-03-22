part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

// ignore: must_be_immutable
class SignUpButtonEvent extends SignUpEvent{

  String name;
  String email;
  String password;
  

  SignUpButtonEvent({required this.name, required this.email,required this.password});
  
}

class LoginScreenNavigationevent extends SignUpEvent{
  
}