import 'dart:convert';

class TaskModel {
    List<UserTask> userTasks;
    UserData userData;

    TaskModel({
        required this.userTasks,
        required this.userData,
    });

    factory TaskModel.fromRawJson(String str) => TaskModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        userTasks: List<UserTask>.from(json["userTasks"].map((x) => UserTask.fromJson(x))),
        userData: UserData.fromJson(json["userData"]),
    );

    Map<String, dynamic> toJson() => {
        "userTasks": List<dynamic>.from(userTasks.map((x) => x.toJson())),
        "userData": userData.toJson(),
    };
}

class UserData {
    String id;
    String email;
    String name;
    String password;
    String roll;
    String image;
    String domain;
    String workExperience;
    List<TasksStarted> tasksStarted;
    List<dynamic> tasksCompleted;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String address;
    int age;
    String batch;
    DateTime dateOfBirth;
    String educationQualification;
    String gender;
    String guardian;
    int phone;
    String place;
    String notifyId;

    UserData({
        required this.id,
        required this.email,
        required this.name,
        required this.password,
        required this.roll,
        required this.image,
        required this.domain,
        required this.workExperience,
        required this.tasksStarted,
        required this.tasksCompleted,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.address,
        required this.age,
        required this.batch,
        required this.dateOfBirth,
        required this.educationQualification,
        required this.gender,
        required this.guardian,
        required this.phone,
        required this.place,
        required this.notifyId,
    });

    factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        roll: json["roll"],
        image: json["image"],
        domain: json["domain"],
        workExperience: json["workExperience"],
        tasksStarted: List<TasksStarted>.from(json["tasksStarted"].map((x) => TasksStarted.fromJson(x))),
        tasksCompleted: List<dynamic>.from(json["tasksCompleted"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        address: json["address"],
        age: json["age"],
        batch: json["batch"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        educationQualification: json["educationQualification"],
        gender: json["gender"],
        guardian: json["guardian"],
        phone: json["phone"],
        place: json["place"],
        notifyId: json["notifyId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "password": password,
        "roll": roll,
        "image": image,
        "domain": domain,
        "workExperience": workExperience,
        "tasksStarted": List<dynamic>.from(tasksStarted.map((x) => x.toJson())),
        "tasksCompleted": List<dynamic>.from(tasksCompleted.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "address": address,
        "age": age,
        "batch": batch,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "educationQualification": educationQualification,
        "gender": gender,
        "guardian": guardian,
        "phone": phone,
        "place": place,
        "notifyId": notifyId,
    };
}

class TasksStarted {
    String taskId;
    String id;
    DateTime date;

    TasksStarted({
        required this.taskId,
        required this.id,
        required this.date,
    });

    factory TasksStarted.fromRawJson(String str) => TasksStarted.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TasksStarted.fromJson(Map<String, dynamic> json) => TasksStarted(
        taskId: json["taskId"],
        id: json["_id"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "_id": id,
        "date": date.toIso8601String(),
    };
}

class UserTask {
    String id;
    String courseName;
    List<String> students;
    List<Task> tasks;
    int v;
    String image;

    UserTask({
        required this.id,
        required this.courseName,
        required this.students,
        required this.tasks,
        required this.v,
        required this.image,
    });

    factory UserTask.fromRawJson(String str) => UserTask.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserTask.fromJson(Map<String, dynamic> json) => UserTask(
        id: json["_id"],
        courseName: json["course_name"],
        students: List<String>.from(json["students"].map((x) => x)),
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
        v: json["__v"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "course_name": courseName,
        "students": List<dynamic>.from(students.map((x) => x)),
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
        "__v": v,
        "image": image,
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
