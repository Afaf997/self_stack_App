import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:self_stack/pages/dashboard_screen/home/functions/pie.dart';
import 'package:table_calendar/table_calendar.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardInitial()) {
    on<DashBoardReloadEvent>(dashBoardReloadEvent);
     on<Dashboardnavigationevent>(dashboardnavigationevent);
     on<InitialEvent>(initialevent);
     on<AttendanceRecordEvent>(attendanceRecordEvent);
  }

  FutureOr<void> dashboardnavigationevent(Dashboardnavigationevent event, Emitter<DashBoardState> emit) {
    emit(DashboardnavigationState());
  }

  FutureOr<void> initialevent(InitialEvent event, Emitter<DashBoardState> emit) {
      List<GDPData> chatdata =getChartData();
      emit(InitaialState(chatdata: chatdata));
  }



  FutureOr<void> dashBoardReloadEvent(DashBoardReloadEvent event, Emitter<DashBoardState> emit) {
    emit(DashBoardInitial());
  }

  FutureOr<void> attendanceRecordEvent(AttendanceRecordEvent event, Emitter<DashBoardState> emit) {
     log("attteee");
       emit(AttendanceRecordState(format: event.format));
      

}
}