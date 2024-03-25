enum AttendanceEnum{
  Present('present'),
  Holiday('holiday'),
  Absend('absent'),
  HalfDay('halfDay'),
  Offline('offline');

  final String value;

  const AttendanceEnum(this.value);

  static AttendanceEnum fromString(String? value) {
    return AttendanceEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AttendanceEnum.Offline,
    );
  }
}
