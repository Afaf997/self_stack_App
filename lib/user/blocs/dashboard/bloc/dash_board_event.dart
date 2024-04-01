part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardEvent {}

class DashBoardReloadEvent extends DashBoardEvent {
  
}

class Dashboardnavigationevent extends DashBoardEvent{}

class InitialEvent extends DashBoardEvent{}

class AttendanceRecordEvent extends DashBoardEvent{

  final  CalendarFormat format;
  AttendanceRecordEvent({required this.format});
}

class NotificationEvent extends  DashBoardEvent{}

class AttendanceNavigationEvent extends DashBoardEvent{}

class TodoNavigationEvent extends DashBoardEvent{}

class AboutNavigationEvent extends DashBoardEvent{}