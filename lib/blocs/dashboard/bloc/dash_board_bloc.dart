import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/pie.dart';
import 'package:self_stack/repository/shared_preference.dart';
import 'package:self_stack/services/dashboard_service.dart';
import 'package:table_calendar/table_calendar.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  getLoginservices getloginservices=getLoginservices();
  DashBoardBloc() : super(DashBoardInitial()) {
    on<DashBoardReloadEvent>(dashBoardReloadEvent);
     on<Dashboardnavigationevent>(dashboardnavigationevent);
     on<InitialEvent>(initialevent);
     on<AttendanceRecordEvent>(attendanceRecordEvent);
     on<NotificationEvent>(notificationEvent);
     on<AttendanceNavigationEvent>(attendanceNavigationEvent);
     on<TodoNavigationEvent>(todoNavigationEvent);
     on<AboutNavigationEvent>(aboutNavigationEvent);
  }

  FutureOr<void> dashboardnavigationevent(Dashboardnavigationevent event, Emitter<DashBoardState> emit) {
    emit(DashboardnavigationState());
  }

 FutureOr<void> initialevent(InitialEvent event, Emitter<DashBoardState> emit) async {
  String? userId = await getUserId();
  getLoginservices loginServices = getLoginservices();
  Map<String, dynamic> apiData = await loginServices.getUserDetails(userId.toString());
  List<GDPData> chatdata = getChartData(apiData);
  emit(InitaialState(chatdata: chatdata));
}



  FutureOr<void> dashBoardReloadEvent(DashBoardReloadEvent event, Emitter<DashBoardState> emit) {
    emit(DashBoardInitial());
  }

  FutureOr<void> attendanceRecordEvent(AttendanceRecordEvent event, Emitter<DashBoardState> emit) {
       emit(AttendanceRecordState(format: event.format));
}

  FutureOr<void> notificationEvent(NotificationEvent event, Emitter<DashBoardState> emit) {
    emit(NotificationState());
  }

  FutureOr<void> attendanceNavigationEvent(AttendanceNavigationEvent event, Emitter<DashBoardState> emit) {
    emit(AttendanceNavigationState());
  }

  FutureOr<void> todoNavigationEvent(TodoNavigationEvent event, Emitter<DashBoardState> emit) {
    emit(TodoNavigationState());
  }

  FutureOr<void> aboutNavigationEvent(AboutNavigationEvent event, Emitter<DashBoardState> emit) {
    emit(AboutNavigationState());
  }
}