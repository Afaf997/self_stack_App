import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/student_data.dart';
import 'package:self_stack/utils/constans.dart';

Color getAttendanceColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return kselfstackGreen;
      case AttendanceStatus.absent:
        return kredtheme;
      case AttendanceStatus.halfDay:
        return kblueTheme;
      case AttendanceStatus.offline:
        return kblackLight;
    }
  }

  String getStatusText(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.halfDay:
        return 'Half Day';
      case AttendanceStatus.offline:
        return 'Offline';
    }
  }