import 'dart:convert';

class Welcome {
    List<BatchElement> batches;

    Welcome({
        required this.batches,
    });

    factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        batches: List<BatchElement>.from(json["batches"].map((x) => BatchElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "batches": List<dynamic>.from(batches.map((x) => x.toJson())),
    };
}

class BatchElement {
    BatchBatch batch;

    BatchElement({
        required this.batch,
    });

    factory BatchElement.fromRawJson(String str) => BatchElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BatchElement.fromJson(Map<String, dynamic> json) => BatchElement(
        batch: BatchBatch.fromJson(json["batch"]),
    );

    Map<String, dynamic> toJson() => {
        "batch": batch.toJson(),
    };
}

class BatchBatch {
    String? batchId;
    String name;
    DateTime startDate;
    List<StudentId> studentIds;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    BatchBatch({
        this.batchId,
        required this.name,
        required this.startDate,
        required this.studentIds,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory BatchBatch.fromRawJson(String str) => BatchBatch.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BatchBatch.fromJson(Map<String, dynamic> json) => BatchBatch(
        batchId: json["id"],
        name: json["name"],
        startDate: DateTime.parse(json["startDate"]),
        studentIds: List<StudentId>.from(json["studentIds"].map((x) => StudentId.fromJson(x))),
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": batchId,
        "name": name,
        "startDate": startDate.toIso8601String(),
        "studentIds": List<dynamic>.from(studentIds.map((x) => x.toJson())),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class StudentId {
    String id;
    String email;
    String name;
    String? password;
    int? phone;
    Roll roll;
    String image;
    String domain;
    List<TasksStarted> tasksStarted;
    List<dynamic> tasksCompleted;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String? googleId;
    String? address;
    int? age;
    String? batch;
    DateTime? dateOfBirth;
    String? educationQualification;
    String? gender;
    String? guardian;
    String? place;
    String? workExperience;

    StudentId({
        required this.id,
        required this.email,
        required this.name,
        this.password,
        this.phone,
        required this.roll,
        required this.image,
        required this.domain,
        required this.tasksStarted,
        required this.tasksCompleted,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.googleId,
        this.address,
        this.age,
        this.batch,
        this.dateOfBirth,
        this.educationQualification,
        this.gender,
        this.guardian,
        this.place,
        this.workExperience,
    });

    factory StudentId.fromRawJson(String str) => StudentId.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StudentId.fromJson(Map<String, dynamic> json) => StudentId(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        roll: rollValues.map[json["roll"]]!,
        image: json["image"],
        domain: json["domain"]!,
        tasksStarted: List<TasksStarted>.from(json["tasksStarted"].map((x) => TasksStarted.fromJson(x))),
        tasksCompleted: List<dynamic>.from(json["tasksCompleted"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        googleId: json["googleId"],
        address: json["address"],
        age: json["age"],
        batch: json["batch"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
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
        "password": password,
        "phone": phone,
        "roll": rollValues.reverse[roll],
        "image": image,
        "domain": domain,
        "tasksStarted": List<dynamic>.from(tasksStarted.map((x) => x.toJson())),
        "tasksCompleted": List<dynamic>.from(tasksCompleted.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "googleId": googleId,
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



enum Roll {
    ADVISOR,
    STUDENT
}

final rollValues = EnumValues({
    "Advisor": Roll.ADVISOR,
    "Student": Roll.STUDENT
});

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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}