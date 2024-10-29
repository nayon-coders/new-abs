// To parse this JSON data, do
//
//     final getAllPartnerModel = getAllPartnerModelFromJson(jsonString);

import 'dart:convert';

GetAllPartnerModel getAllPartnerModelFromJson(String str) => GetAllPartnerModel.fromJson(json.decode(str));

String getAllPartnerModelToJson(GetAllPartnerModel data) => json.encode(data.toJson());

class GetAllPartnerModel {
  final bool? success;
  final String? message;
  final int? totalPartners;
  final List<Datum>? data;

  GetAllPartnerModel({
    this.success,
    this.message,
    this.totalPartners,
    this.data,
  });

  factory GetAllPartnerModel.fromJson(Map<String, dynamic> json) => GetAllPartnerModel(
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
  final dynamic? percentage;
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
