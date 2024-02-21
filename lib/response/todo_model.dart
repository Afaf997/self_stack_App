import 'dart:convert';

class TodoModel {
    String id;
    String title;
    String subtitle;
    bool isPublic;
    String createdBy;
    int percentage;
    String status;
    int v;

    TodoModel({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.isPublic,
        required this.createdBy,
        required this.percentage,
        required this.status,
        required this.v,
    });

    factory TodoModel.fromRawJson(String str) => TodoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TodoModel.fromJson(Map<String, dynamic> json) {
  return TodoModel(
    id: json["_id"] ?? "",
    title: json["title"] ?? "",
    subtitle: json["subtitle"] ?? "",
    isPublic: json["isPublic"] ?? false,
    createdBy: json["createdBy"] ?? "",
    percentage: json["percentage"] ?? 0,
    status: json["status"] ?? "",
    v: json["__v"] ?? 0,
  );
}


    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "subtitle": subtitle,
        "isPublic": isPublic,
        "createdBy": createdBy,
        "percentage": percentage,
        "status": status,
        "__v": v,
    };
}
