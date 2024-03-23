class StudentData {
  final String id;
  final String name;
  final String details;
  final String avatarImage;
  final String batch;
  AttendanceStatus attendanceStatus;
  List<dynamic>? attendance;

  StudentData({
    required this.id,
    required this.name,
    required this.batch,
    required this.details,
    required this.avatarImage,
    required this.attendanceStatus,
  });
}

enum AttendanceStatus {
  present,
  absent,
  halfDay,
  offline,
}