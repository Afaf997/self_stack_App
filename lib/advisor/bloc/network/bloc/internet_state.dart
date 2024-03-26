// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

class Connected extends InternetState {
  String msg;
  Connected({required this.msg,});

}

class NotConnected extends InternetState{
    String msg;
  NotConnected({required this.msg,});
}