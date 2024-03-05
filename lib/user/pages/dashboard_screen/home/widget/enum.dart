enum AttendanceEnum{
  Present('Present'),
  Holiday('Holiday'),
  Absend('Absend'),
  HalfDay('HalfDay'),
  Offline('Offline');

  final String value;

  const AttendanceEnum(this.value);

  static AttendanceEnum fromString(String? value) {
    return AttendanceEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AttendanceEnum.Offline,
    );
  }
}
