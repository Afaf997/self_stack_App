part of 'internet_bloc.dart';

@immutable
sealed class InternetEvent {}

class OnConnected extends InternetEvent{}

class OnNotConnected extends InternetEvent{}
