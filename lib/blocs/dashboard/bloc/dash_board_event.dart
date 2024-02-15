part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardEvent {}

class DashBoardReloadEvent extends DashBoardEvent {
  
}

class Dashboardnavigationevent extends DashBoardEvent{}

class InitialEvent extends DashBoardEvent{}