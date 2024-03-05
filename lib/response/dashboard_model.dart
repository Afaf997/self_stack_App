import 'dart:convert';

class Dashboard {
    User user;
    List<dynamic> attendance;
    String domain;
    ReviewStatusCounts reviewStatusCounts;
    String randomQuote;
    String randomAuthor;

    Dashboard({
        required this.user,
        required this.attendance,
        required this.domain,
        required this.reviewStatusCounts,
        required this.randomQuote,
        required this.randomAuthor,
    });

    factory Dashboard.fromRawJson(String str) => Dashboard.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        user: User.fromJson(json["user"]),
        attendance: List<dynamic>.from(json["attendance"].map((x) => x)),
        domain: json["domain"],
        reviewStatusCounts: ReviewStatusCounts.fromJson(json["reviewStatusCounts"]),
        randomQuote: json["randomQuote"],
        randomAuthor: json["randomAuthor"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "attendance": List<dynamic>.from(attendance.map((x) => x)),
        "domain": domain,
        "reviewStatusCounts": reviewStatusCounts.toJson(),
        "randomQuote": randomQuote,
        "randomAuthor": randomAuthor,
    };
}

class ReviewStatusCounts {
    int notAttended;
    int taskCompleted;
    int notCompleted;
    int taskRepeated;
    int needImprovement;

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
        notAttended: json["Not Attended"],
        taskCompleted: json["Task Completed"],
        notCompleted: json["Not Completed"],
        taskRepeated: json["Task Repeated"],
        needImprovement: json["Need Improvement"],
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
    String id;
    String email;
    String name;
    String roll;
    String googleId;
    String image;
    String domain;
    List<TasksStarted> tasksStarted;
    List<dynamic> tasksCompleted;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String password;
    String address;
    int age;
    String batch;
    DateTime dateOfBirth;
    String educationQualification;
    String gender;
    String guardian;
    String place;
    String workExperience;

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
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        roll: json["roll"],
        googleId: json["googleId"],
        image: json["image"],
        domain: json["domain"],
        tasksStarted: List<TasksStarted>.from(json["tasksStarted"].map((x) => TasksStarted.fromJson(x))),
        tasksCompleted: List<dynamic>.from(json["tasksCompleted"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        password: json["password"],
        address: json["address"],
        age: json["age"],
        batch: json["batch"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        educationQualification: json["educationQualification"],
        gender: json["gender"],
        guardian: json["guardian"],
        place: json["place"],
        workExperience: json["workExperience"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "roll": roll,
        "googleId": googleId,
        "image": image,
        "domain": domain,
        "tasksStarted": List<dynamic>.from(tasksStarted.map((x) => x.toJson())),
        "tasksCompleted": List<dynamic>.from(tasksCompleted.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "password": password,
        "address": address,
        "age": age,
        "batch": batch,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "educationQualification": educationQualification,
        "gender": gender,
        "guardian": guardian,
        "place": place,
        "workExperience": workExperience,
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