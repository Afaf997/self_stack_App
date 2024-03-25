
import 'dart:convert';

class AttendanceStudentUser {
  StudentUser Studentuser;
  List<dynamic>? attendance;
  String? domain;
  ReviewStatusCounts? reviewStatusCounts;
  String? randomQuote;
  String? randomAuthor;
  AttendanceStatus? attendanceStatus;

  AttendanceStudentUser({
    required this.Studentuser,
    this.attendance,    
    this.domain,
    this.reviewStatusCounts,
    this.randomQuote,
    this.randomAuthor,
    this.attendanceStatus,
  });

  factory AttendanceStudentUser.fromRawJson(String str) => AttendanceStudentUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttendanceStudentUser.fromJson(Map<String, dynamic> json) => AttendanceStudentUser(
        Studentuser: StudentUser.fromJson(json["StudentUser"]),
        attendance: json["attendance"] != null ? List<dynamic>.from(json["attendance"].map((x) => x)) : null,
        domain: json["domain"] ?? "dummy",
        reviewStatusCounts: json["reviewStatusCounts"] != null ? ReviewStatusCounts.fromJson(json["reviewStatusCounts"]) : null,
        randomQuote: json["randomQuote"] ?? "hello",
        randomAuthor: json["randomAuthor"] ?? "hello",
      );

  Map<String, dynamic> toJson() => {
        "StudentUser": Studentuser.toJson(),
        "attendance": attendance != null ? List<dynamic>.from(attendance!.map((x) => x)) : null,
        "domain": domain,
        "reviewStatusCounts": reviewStatusCounts != null ? reviewStatusCounts!.toJson() : null,
        "randomQuote": randomQuote,
        "randomAuthor": randomAuthor,
      };
}

class ReviewStatusCounts {
  int? notAttended;
  int? taskCompleted;
  int? notCompleted;
  int? taskRepeated;
  int? needImprovement;

  ReviewStatusCounts({
    required this.notAttended,
    required this.taskCompleted,
    required this.notCompleted,
    required this.taskRepeated,
    required this.needImprovement,
  });

  factory ReviewStatusCounts.fromRawJson(String str) => ReviewStatusCounts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewStatusCounts.fromJson(Map<String, dynamic> json) => ReviewStatusCounts(
        notAttended: json["Not Attended"] ?? 0,
        taskCompleted: json["Task Completed"] ?? 0,
        notCompleted: json["Not Completed"] ?? 0,
        taskRepeated: json["Task Repeated"] ?? 0,
        needImprovement: json["Need Improvement"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "Not Attended": notAttended,
        "Task Completed": taskCompleted,
        "Not Completed": notCompleted,
        "Task Repeated": taskRepeated,
        "Need Improvement": needImprovement,
      };
}

class StudentUser {
  String? id;
  String? email;
  String? name;
  String? roll;
  String? googleId;
  String? image;
  String? batch;


  StudentUser({
    required this.id,
    required this.email,
    required this.name,
    this.roll,
    this.googleId,
    required this.image,
    this.batch,
  });

  factory StudentUser.fromRawJson(String str) => StudentUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentUser.fromJson(Map<String, dynamic> json) => StudentUser(
        id: json["_id"] ?? "dummy",
        email: json["email"] ?? "dummy",
        name: json["name"] ?? "dummy",
        image: json["image"] ?? "dummy",
        
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "roll": roll,
        "googleId": googleId,
        "image": image,
      };
}

class TasksStarted {
  String? taskId;
  String? id;
  DateTime? date;

  TasksStarted({
    required this.taskId,
    required this.id,
    required this.date,
  });

  factory TasksStarted.fromRawJson(String str) => TasksStarted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TasksStarted.fromJson(Map<String, dynamic> json) => TasksStarted(
        taskId: json["taskId"] ?? "dummy",
        id: json["_id"] ?? "dummy",
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "_id": id,
        "date": date?.toIso8601String(),
      };
}

enum AttendanceStatus {
  present,
  absent,
  halfDay,
  offline,
}
