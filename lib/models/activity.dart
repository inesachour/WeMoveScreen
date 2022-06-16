import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.image1,
    required this.image2,
    required this.activityTypeId,
    required this.createdAt,
    required this.updatedAt,
    required this.accessibility,
    this.deletedAt,
    required this.activityType,
    required this.recommendations,
    required this.idealFor,
  });

  String id;
  String name;
  String description;
  String image1;
  String image2;
  String activityTypeId;
  DateTime createdAt;
  DateTime updatedAt;
  int accessibility;
  DateTime? deletedAt;
  ActivityType activityType;
  List<Recommendation> recommendations;
  List<Recommendation> idealFor;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image1: json["image_1"],
    image2: json["image_2"],
    activityTypeId: json["activity_type_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    accessibility: json["accessibility"],
    deletedAt: json["deleted_at"],
    activityType: ActivityType.fromJson(json["activity_type"]),
    recommendations: List<Recommendation>.from(json["recommendations"].map((x) => Recommendation.fromJson(x))),
    idealFor: List<Recommendation>.from(json["ideal_for"].map((x) => Recommendation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image_1": image1,
    "image_2": image2,
    "activity_type_id": activityTypeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "accessibility": accessibility,
    "deleted_at": deletedAt,
    "activity_type": activityType.toJson(),
    "recommendations": List<dynamic>.from(recommendations.map((x) => x.toJson())),
    "ideal_for": List<dynamic>.from(idealFor.map((x) => x.toJson())),
  };
}

class ActivityType {
  ActivityType({
    required this.id,
    required this.label,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String label;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory ActivityType.fromJson(Map<String, dynamic> json) => ActivityType(
    id: json["id"],
    label: json["label"],
    description: json["description"] == null ? null : json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "description": description == null ? null : description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}


class Recommendation {
  Recommendation({
    required this.id,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String label;
  DateTime createdAt;
  DateTime updatedAt;

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    id: json["id"],
    label: json["label"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

