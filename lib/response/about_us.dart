import 'dart:convert';

class AboutUs {
    String id;
    String email;
    String phoneNumber;
    String content;
    String logo;
    String paraContent;
    String subtitle;
    String paraSub;
    List<PointsAndDetail> pointsAndDetails;
    String privacyLink;
    List<SocialMedia> socialMedia;
    int v;
    String heading;

    AboutUs({
        required this.id,
        required this.email,
        required this.phoneNumber,
        required this.content,
        required this.logo,
        required this.paraContent,
        required this.subtitle,
        required this.paraSub,
        required this.pointsAndDetails,
        required this.privacyLink,
        required this.socialMedia,
        required this.v,
        required this.heading,
    });

    factory AboutUs.fromRawJson(String str) => AboutUs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
        id: json["_id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        content: json["content"],
        logo: json["logo"],
        paraContent: json["paraContent"],
        subtitle: json["subtitle"],
        paraSub: json["paraSub"],
        pointsAndDetails: List<PointsAndDetail>.from(json["pointsAndDetails"].map((x) => PointsAndDetail.fromJson(x))),
        privacyLink: json["privacyLink"],
        socialMedia: List<SocialMedia>.from(json["socialMedia"].map((x) => SocialMedia.fromJson(x))),
        v: json["__v"],
        heading: json["heading"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "content": content,
        "logo": logo,
        "paraContent": paraContent,
        "subtitle": subtitle,
        "paraSub": paraSub,
        "pointsAndDetails": List<dynamic>.from(pointsAndDetails.map((x) => x.toJson())),
        "privacyLink": privacyLink,
        "socialMedia": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
        "__v": v,
        "heading": heading,
    };
}

class PointsAndDetail {
    String point;
    String details;
    String id;

    PointsAndDetail({
        required this.point,
        required this.details,
        required this.id,
    });

    factory PointsAndDetail.fromRawJson(String str) => PointsAndDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PointsAndDetail.fromJson(Map<String, dynamic> json) => PointsAndDetail(
        point: json["point"],
        details: json["details"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "point": point,
        "details": details,
        "_id": id,
    };
}

class SocialMedia {
    String icon;
    String link;
    String id;

    SocialMedia({
        required this.icon,
        required this.link,
        required this.id,
    });

    factory SocialMedia.fromRawJson(String str) => SocialMedia.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        icon: json["icon"],
        link: json["link"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "link": link,
        "_id": id,
    };
}
