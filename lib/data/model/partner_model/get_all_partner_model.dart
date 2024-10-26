// To parse this JSON data, do
//
//     final getAllPartner = getAllPartnerFromJson(jsonString);

import 'dart:convert';

GetAllPartner getAllPartnerFromJson(String str) => GetAllPartner.fromJson(json.decode(str));

String getAllPartnerToJson(GetAllPartner data) => json.encode(data.toJson());

class GetAllPartner {
  final bool? success;
  final String? message;
  final int? totalPartners;
  final List<Datum>? data;

  GetAllPartner({
    this.success,
    this.message,
    this.totalPartners,
    this.data,
  });

  factory GetAllPartner.fromJson(Map<String, dynamic> json) => GetAllPartner(
    success: json["success"],
    message: json["message"],
    totalPartners: json["totalPartners"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalPartners": totalPartners,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final int? percentage;
  final String? profilePic;
  final int? busnId;

  Datum({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.percentage,
    this.profilePic,
    this.busnId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    percentage: json["percentage"],
    profilePic: json["profilePic"],
    busnId: json["busn_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "percentage": percentage,
    "profilePic": profilePic,
    "busn_id": busnId,
  };
}
