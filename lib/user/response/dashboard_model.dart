import 'dart:convert';

class Users {
  User user;
  List<dynamic>? attendance;
  String? domain;
  ReviewStatusCounts? reviewStatusCounts;
  String? randomQuote;
  String? randomAuthor;

  Users({
    required this.user,
    this.attendance,
    this.domain,
    this.reviewStatusCounts,
    this.randomQuote,
    this.randomAuthor,
  });

  factory Users.fromRawJson(String str) => Users.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        user: User.fromJson(json["user"]),
        attendance: json["attendance"] != null ? List<dynamic>.from(json["attendance"].map((x) => x)) : null,
        domain: json["domain"] ?? "dummy",
        reviewStatusCounts: json["reviewStatusCounts"] != null ? ReviewStatusCounts.fromJson(json["reviewStatusCounts"]) : null,
        randomQuote: json["randomQuote"] ?? "hello",
        randomAuthor: json["randomAuthor"] ?? "hello",
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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

class User {
  String? id;
  String? email;
  String? name;
  String? roll;
  String? googleId;
  String? image;
  String? domain;
  List<TasksStarted>? tasksStarted;
  List<dynamic>? tasksCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? password;
  String? address;
  int? age;
  String? batch;
  DateTime? dateOfBirth;
  String? educationQualification;
  String? gender;
  String? guardian;
  String? place;
  String? workExperience;
  int? phone;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.roll,
    required this.googleId,
    required this.image,
    required this.domain,
    required this.tasksStarted,
    required this.tasksCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.password,
    required this.address,
    required this.age,
    required this.batch,
    required this.dateOfBirth,
    required this.educationQualification,
    required this.gender,
    required this.guardian,
    required this.place,
    required this.workExperience,
    required this.phone,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] ?? "dummy",
        email: json["email"] ?? "dummy",
        name: json["name"] ?? "dummy",
        roll: json["roll"] ?? "dummy",
        googleId: json["googleId"] ?? "dummy",
        image: json["image"] ?? "dummy",
        domain: json["domain"] ?? "dummy",
        tasksStarted: json["tasksStarted"] != null
            ? List<TasksStarted>.from(json["tasksStarted"].map((x) => TasksStarted.fromJson(x)))
            : null,
        tasksCompleted: json["tasksCompleted"] != null ? List<dynamic>.from(json["tasksCompleted"].map((x) => x)) : null,
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
        v: json["__v"] ?? 0,
        password: json["password"] ?? "dummy",
        address: json["address"] ?? "dummy",
        age: json["age"] ?? 0,
        batch: json["batch"] ?? "dummy",
        dateOfBirth: json["dateOfBirth"] != null ? DateTime.parse(json["dateOfBirth"]) : null,
        educationQualification: json["educationQualification"] ?? "dummy",
        gender: json["gender"] ?? "dummy",
        guardian: json["guardian"] ?? "dummy",
        place: json["place"] ?? "dummy",
        workExperience: json["workExperience"] ?? "dummy", phone: null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "roll": roll,
        "googleId": googleId,
        "image": image,
        "domain": domain,
        "tasksStarted": tasksStarted != null ? List<dynamic>.from(tasksStarted!.map((x) => x.toJson())) : null,
        "tasksCompleted": tasksCompleted != null ? List<dynamic>.from(tasksCompleted!.map((x) => x)) : null,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "password": password,
        "address": address,
        "age": age,
        "batch": batch,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "educationQualification": educationQualification,
        "gender": gender,
        "guardian": guardian,
        "place": place,
        "workExperience": workExperience,
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
