// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    required this.id,
    required this.duration,
    required this.daypassOnly,
    required this.activityId,
    required this.partnerId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.excludeDaypass,
    required this.nomadPrice,
    required this.companyPrice,
    required this.activity,
    required this.requirements,
    required this.courseInfos,
  });

  String id;
  int duration;
  int daypassOnly;
  String activityId;
  String partnerId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int excludeDaypass;
  dynamic nomadPrice;
  dynamic companyPrice;
  CourseActivity activity;
  List<Requirement> requirements;
  List<CourseInfo> courseInfos;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    duration: json["duration"],
    daypassOnly: json["daypass_only"],
    activityId: json["activity_id"],
    partnerId: json["partner_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    excludeDaypass: json["exclude_daypass"],
    nomadPrice: json["nomad_price"],
    companyPrice: json["company_price"],
    activity: CourseActivity.fromJson(json["activity"]),
    requirements: List<Requirement>.from(json["requirements"].map((x) => Requirement.fromJson(x))),
    courseInfos: List<CourseInfo>.from(json["course_infos"].map((x) => CourseInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "duration": duration,
    "daypass_only": daypassOnly,
    "activity_id": activityId,
    "partner_id": partnerId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "exclude_daypass": excludeDaypass,
    "nomad_price": nomadPrice,
    "company_price": companyPrice,
  //  "activity": activity.toJson(),
    "requirements": List<dynamic>.from(requirements.map((x) => x.toJson())),
    "course_infos": List<dynamic>.from(courseInfos.map((x) => x.toJson())),
  };
}

class CourseActivity {
  CourseActivity({
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

  factory CourseActivity.fromJson(Map<String, dynamic> json) => CourseActivity(
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
  };
}

class CourseInfo {
  CourseInfo({
    required this.id,
    required this.date,
    required this.stock,
    required this.level,
    required this.nomadPrice,
    required this.companyPrice,
    required this.courseId,
    required this.planningId,
    this.coachId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    this.deletedAt,
    required this.initialStock,
    required this.batchId,
  });

  String id;
  DateTime date;
  int stock;
  int level;
  int? nomadPrice;
  int? companyPrice;
  String courseId;
  String planningId;
  dynamic coachId;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  DateTime? deletedAt;
  int initialStock;
  String batchId;

  factory CourseInfo.fromJson(Map<String, dynamic> json) => CourseInfo(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    stock: json["stock"],
    level: json["level"],
    nomadPrice: json["nomad_price"] == null ? null : json["nomad_price"],
    companyPrice: json["company_price"] == null ? null : json["company_price"],
    courseId: json["course_id"],
    planningId: json["planning_id"],
    coachId: json["coach_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    deletedAt: json["deleted_at"],
    initialStock: json["initial_stock"],
    batchId: json["batch_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "stock": stock,
    "level": level,
    "nomad_price": nomadPrice == null ? null : nomadPrice,
    "company_price": companyPrice == null ? null : companyPrice,
    "course_id": courseId,
    "planning_id": planningId,
    "coach_id": coachId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "deleted_at": deletedAt,
    "initial_stock": initialStock,
    "batch_id": batchId,
  };
}

class Requirement {
  Requirement({
    required this.id,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String label;
  DateTime createdAt;
  DateTime updatedAt;

  factory Requirement.fromJson(Map<String, dynamic> json) => Requirement(
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

