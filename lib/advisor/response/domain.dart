import 'dart:convert';

class Domain {
  String? id;
  String? courseName;
  List<Student?>? students;
  List<Task>? tasks;
  int? v;
  String? image;

  Domain({
    this.id,
    this.courseName,
    this.students,
    this.tasks,
    this.v,
    this.image,
  });

  factory Domain.fromRawJson(String str) => Domain.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json["_id"],
        courseName: json["course_name"],
        students: json["students"] != null
            ? List<Student?>.from(json["students"].map((x) => x == null ? null : Student.fromJson(x)))
            : null,
        tasks: json["tasks"] != null
            ? List<Task>.from(json["tasks"].map((x) => Task.fromJson(x)))
            : null,
        v: json["__v"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "course_name": courseName,
        "students": students != null ? List<dynamic>.from(students!.map((x) => x?.toJson())) : null,
        "tasks": tasks != null ? List<dynamic>.from(tasks!.map((x) => x.toJson())) : null,
        "__v": v,
        "image": image,
      };
}

class Student {
  String? id;
  String? email;
  String? name;
  String? password;
  int? phone;
  String? image;
  String? address;
  int? age;
  String? batch;
  DateTime? dateOfBirth;
  String? educationQualification;
  String? gender;
  String? guardian;
  String? place;
  String? googleId;
  String? notifyId;

  Student({
    this.id,
    this.email,
    this.name,
    this.password,
    this.phone,
    this.image,
    this.address,
    this.age,
    this.batch,
    this.dateOfBirth,
    this.educationQualification,
    this.gender,
    this.guardian,
    this.place,
    this.googleId,
    this.notifyId,
  });

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        image: json["image"],
        address: json["address"],
        age: json["age"] != null ? json['age']: 0,
        batch: json["batch"],
        dateOfBirth: json["dateOfBirth"] != null ? DateTime.parse(json["dateOfBirth"]) : null,
        educationQualification: json["educationQualification"],
        gender: json["gender"],
        guardian: json["guardian"],
        place: json["place"],
        googleId: json["googleId"],
        notifyId: json["notifyId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "password": password,
        "phone": phone,
        "image": image,
        "address": address,
        "age": age,
        "batch": batch,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "educationQualification": educationQualification,
        "gender": gender,
        "guardian": guardian,
        "place": place,
        "googleId": googleId,
        "notifyId": notifyId,
      };
}

class Task {
  String? taskName;
  String? title;
  String? duration;
  List<Subtitle>? subtitle;
  String? id;

  Task({
    this.taskName,
    this.title,
    this.duration,
    this.subtitle,
    this.id,
  });

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskName: json["task_name"],
        title: json["title"],
        duration: json["duration"],
        subtitle: json["subtitle"] != null
            ? List<Subtitle>.from(json["subtitle"].map((x) => Subtitle.fromJson(x)))
            : null,
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "task_name": taskName,
        "title": title,
        "duration": duration,
        "subtitle": subtitle != null ? List<dynamic>.from(subtitle!.map((x) => x.toJson())) : null,
        "_id": id,
      };
}

class Subtitle {
  String? subtitleName;
  List<String>? points;
  String? id;

  Subtitle({
    this.subtitleName,
    this.points,
    this.id,
  });

  factory Subtitle.fromRawJson(String str) => Subtitle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subtitle.fromJson(Map<String, dynamic> json) => Subtitle(
        subtitleName: json["subtitle_name"],
        points: json["points"] != null ? List<String>.from(json["points"].map((x) => x)) : null,
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "subtitle_name": subtitleName,
        "points": points != null ? List<dynamic>.from(points!.map((x) => x)) : null,
        "_id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}