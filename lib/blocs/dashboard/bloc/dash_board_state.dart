part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardState {}

final class DashBoardInitial extends DashBoardState {}

class InitaialState extends dashboardAction {
  List<GDPData> chatdata;

  InitaialState({required this.chatdata});
}

abstract class dashboardAction extends DashBoardState {}

class DashboardnavigationState extends dashboardAction {}
