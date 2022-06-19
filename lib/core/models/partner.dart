// To parse this JSON data, do
//
//     final partners = partnersFromJson(jsonString);

import 'dart:convert';

Partners partnersFromJson(String str) => Partners.fromJson(json.decode(str));

String partnersToJson(Partners data) => json.encode(data.toJson());

class Partners {
  Partners({
    required this.partners,
  });

  List<Partner> partners;

  factory Partners.fromJson(Map<String, dynamic> json) => Partners(
    partners: List<Partner>.from(json["partners"].map((x) => Partner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "partners": List<dynamic>.from(partners.map((x) => x.toJson())),
  };
}

class Partner {
  Partner({
    required this.id,
    required this.name,
    required this.description,
    required this.phone1,
    required this.phone2,
    required this.email,
    required this.logo,
    required this.image1,
    this.image2,
    this.image3,
    required this.emailVerifiedAt,
    required this.partnerTypeId,
    required this.createdAt,
    required this.updatedAt,
    required this.percentageNomad,
    required this.percentageCompany,
    this.deletedAt,
    required this.notArchived,
    this.administratorId,
    required this.passPrice,
    required this.partnerType,
    required this.geoZone,
  });

  String id;
  String name;
  String description;
  String phone1;
  String? phone2;
  String email;
  String logo;
  String image1;
  String? image2;
  dynamic image3;
  DateTime emailVerifiedAt;
  String partnerTypeId;
  DateTime createdAt;
  DateTime updatedAt;
  int percentageNomad;
  int percentageCompany;
  dynamic deletedAt;
  int notArchived;
  dynamic administratorId;
  int passPrice;
  PartnerType partnerType;
  GeoZone geoZone;

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    phone1: json["phone_1"],
    phone2: json["phone_2"] == null ? null : json["phone_2"],
    email: json["email"],
    logo: json["logo"],
    image1: json["image_1"],
    image2: json["image_2"],
    image3: json["image_3"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    partnerTypeId: json["partner_type_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    percentageNomad: json["percentage_nomad"],
    percentageCompany: json["percentage_company"],
    deletedAt: json["deleted_at"],
    notArchived: json["not_archived"],
    administratorId: json["administrator_id"],
    passPrice: json["pass_price"],
    partnerType: PartnerType.fromJson(json["partner_type"]),
    geoZone: GeoZone.fromJson(json["geo_zone"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "phone_1": phone1,
    "phone_2": phone2 == null ? null : phone2,
    "email": email,
    "logo": logo,
    "image_1": image1,
    "image_2": image2,
    "image_3": image3,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "partner_type_id": partnerTypeId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "percentage_nomad": percentageNomad,
    "percentage_company": percentageCompany,
    "deleted_at": deletedAt,
    "not_archived": notArchived,
    "administrator_id": administratorId,
    "pass_price": passPrice,
    "partner_type": partnerType.toJson(),
    "geo_zone": geoZone.toJson(),
  };
}

class GeoZone {
  GeoZone({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.geoZoneableType,
    required this.geoZoneableId,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.geoZoneLabelId,
    required this.createdAt,
    required this.updatedAt,
    required this.geoZoneLabel,
  });

  String id;
  double latitude;
  double longitude;
  String geoZoneableType;
  String geoZoneableId;
  String address;
  int zipCode;
  String city;
  String geoZoneLabelId;
  DateTime createdAt;
  DateTime updatedAt;
  PartnerType geoZoneLabel;

  factory GeoZone.fromJson(Map<String, dynamic> json) => GeoZone(
    id: json["id"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    geoZoneableType: json["geo_zoneable_type"],
    geoZoneableId: json["geo_zoneable_id"],
    address: json["address"],
    zipCode: json["zip_code"],
    city: json["city"],
    geoZoneLabelId: json["geo_zone_label_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    geoZoneLabel: PartnerType.fromJson(json["geo_zone_label"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longitude": longitude,
    "geo_zoneable_type": geoZoneableType,
    "geo_zoneable_id": geoZoneableId,
    "address": address,
    "zip_code": zipCode,
    "city": city,
    "geo_zone_label_id": geoZoneLabelId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "geo_zone_label": geoZoneLabel.toJson(),
  };
}

class PartnerType {
  PartnerType({
    required this.id,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  String id;
  String label;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory PartnerType.fromJson(Map<String, dynamic> json) => PartnerType(
    id: json["id"],
    label: json["label"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
