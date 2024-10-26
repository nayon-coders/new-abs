// To parse this JSON data, do
//
//     final getSinglePartner = getSinglePartnerFromJson(jsonString);

import 'dart:convert';

GetSinglePartner getSinglePartnerFromJson(String str) => GetSinglePartner.fromJson(json.decode(str));

String getSinglePartnerToJson(GetSinglePartner data) => json.encode(data.toJson());

class GetSinglePartner {
  final bool? success;
  final PartnerInfo? partnerInfo;
  final Map<String, int>? wholeBusiness;

  GetSinglePartner({
    this.success,
    this.partnerInfo,
    this.wholeBusiness,
  });

  factory GetSinglePartner.fromJson(Map<String, dynamic> json) => GetSinglePartner(
    success: json["success"],
    partnerInfo: json["partnerInfo"] == null ? null : PartnerInfo.fromJson(json["partnerInfo"]),
    wholeBusiness: Map.from(json["wholeBusiness"]!).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "partnerInfo": partnerInfo?.toJson(),
    "wholeBusiness": Map.from(wholeBusiness!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class PartnerInfo {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final int? percentage;
  final String? profilePic;
  final int? busnId;
  final int? partnerProfit;
  final int? partnerLoss;
  final int? partnerNetIncome;

  PartnerInfo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.percentage,
    this.profilePic,
    this.busnId,
    this.partnerProfit,
    this.partnerLoss,
    this.partnerNetIncome,
  });

  factory PartnerInfo.fromJson(Map<String, dynamic> json) => PartnerInfo(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    percentage: json["percentage"],
    profilePic: json["profilePic"],
    busnId: json["busn_id"],
    partnerProfit: json["partnerProfit"],
    partnerLoss: json["partnerLoss"],
    partnerNetIncome: json["partnerNetIncome"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "percentage": percentage,
    "profilePic": profilePic,
    "busn_id": busnId,
    "partnerProfit": partnerProfit,
    "partnerLoss": partnerLoss,
    "partnerNetIncome": partnerNetIncome,
  };
}
