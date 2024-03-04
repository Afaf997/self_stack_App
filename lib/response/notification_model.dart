import 'dart:convert';

class Notification_model{
    bool success;
    List<NotificationElement> notifications;

    Notification_model({
        required this.success,
        required this.notifications,
    });

    factory Notification_model.fromRawJson(String str) => Notification_model.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Notification_model.fromJson(Map<String, dynamic> json) => Notification_model(
        success: json["success"],
        notifications: List<NotificationElement>.from(json["notifications"].map((x) => NotificationElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    };
}

class NotificationElement {
    String id;
    String userId;
    String title;
    String body;
    String deviceToken;
    DateTime sentAt;
    int v;

    NotificationElement({
        required this.id,
        required this.userId,
        required this.title,
        required this.body,
        required this.deviceToken,
        required this.sentAt,
        required this.v,
    });

    factory NotificationElement.fromRawJson(String str) => NotificationElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NotificationElement.fromJson(Map<String, dynamic> json) => NotificationElement(
        id: json["_id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
        deviceToken: json["deviceToken"],
        sentAt: DateTime.parse(json["sentAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "title": title,
        "body": body,
        "deviceToken": deviceToken,
        "sentAt": sentAt.toIso8601String(),
        "__v": v,
    };
}
