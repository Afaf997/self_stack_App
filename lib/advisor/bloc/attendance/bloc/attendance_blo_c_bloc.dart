import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'attendance_blo_c_event.dart';
part 'attendance_blo_c_state.dart';

class AttendanceBloCBloc extends Bloc<AttendanceBloCEvent, AttendanceBloCState> {
  AttendanceBloCBloc() : super(AttendanceBloCInitial()) {
    on<AttendanceBloCEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
