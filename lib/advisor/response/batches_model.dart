import 'dart:convert';

class Domainbatch {
    String id;
    String courseName;
    List<String> students;
    List<Task> tasks;
    int v;

    Domainbatch({
        required this.id,
        required this.courseName,
        required this.students,
        required this.tasks,
        required this.v,
    });

    factory Domainbatch.fromRawJson(String str) => Domainbatch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Domainbatch.fromJson(Map<String, dynamic> json) => Domainbatch(
        id: json["_id"],
        courseName: json["course_name"],
        students: List<String>.from(json["students"].map((x) => x)),
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "course_name": courseName,
        "students": List<dynamic>.from(students.map((x) => x)),
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
        "__v": v,
    };
}

class Task {
    String taskName;
    String title;
    String duration;
    List<Subtitle> subtitle;
    String id;

    Task({
        required this.taskName,
        required this.title,
        required this.duration,
        required this.subtitle,
        required this.id,
    });

    factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskName: json["task_name"],
        title: json["title"],
        duration: json["duration"],
        subtitle: List<Subtitle>.from(json["subtitle"].map((x) => Subtitle.fromJson(x))),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "task_name": taskName,
        "title": title,
        "duration": duration,
        "subtitle": List<dynamic>.from(subtitle.map((x) => x.toJson())),
        "_id": id,
    };
}

class Subtitle {
    String subtitleName;
    List<String> points;
    String id;

    Subtitle({
        required this.subtitleName,
        required this.points,
        required this.id,
    });

    factory Subtitle.fromRawJson(String str) => Subtitle.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Subtitle.fromJson(Map<String, dynamic> json) => Subtitle(
        subtitleName: json["subtitle_name"],
        points: List<String>.from(json["points"].map((x) => x)),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "subtitle_name": subtitleName,
        "points": List<dynamic>.from(points.map((x) => x)),
        "_id": id,
    };
}