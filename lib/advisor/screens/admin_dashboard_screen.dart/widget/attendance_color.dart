import 'dart:ui';

import 'package:self_stack/advisor/response/student_data.dart';
import 'package:self_stack/utils/constans.dart';

Color getAttendanceColor(String? status) {
  if (status == null) {
    return kblackLight; 
  }
  switch (status) {
    case 'present':
      return kselfstackGreen;
    case 'absent':
      return kredtheme;
    case 'halfDay':
      return kblueTheme;
    case 'offline': // Corrected spelling from 'ofline' to 'offline'
      return kblackLight;
    default:
      return kblackLight; // Default case to handle unexpected status
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
