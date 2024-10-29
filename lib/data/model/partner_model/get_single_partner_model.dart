// To parse this JSON data, do
//
//     final getSinglePartnerModel = getSinglePartnerModelFromJson(jsonString);

import 'dart:convert';

GetSinglePartnerModel getSinglePartnerModelFromJson(String str) => GetSinglePartnerModel.fromJson(json.decode(str));

String getSinglePartnerModelToJson(GetSinglePartnerModel data) => json.encode(data.toJson());

class GetSinglePartnerModel {
  final bool? success;
  final PartnerInfo? partnerInfo;
  final Map<String, double>? wholeBusiness;

  GetSinglePartnerModel({
    this.success,
    this.partnerInfo,
    this.wholeBusiness,
  });

  factory GetSinglePartnerModel.fromJson(Map<String, dynamic> json) => GetSinglePartnerModel(
    success: json["success"],
    partnerInfo: json["partnerInfo"] == null ? null : PartnerInfo.fromJson(json["partnerInfo"]),
    wholeBusiness: Map.from(json["wholeBusiness"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
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
  final dynamic? percentage;
  final String? profilePic;
  final int? busnId;
  final int? partnerProfit;
  final double? partnerLoss;
  final double? partnerNetIncome;

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
    percentage: json["percentage"]?.toDouble(),
    profilePic: json["profilePic"],
    busnId: json["busn_id"],
    partnerProfit: json["partnerProfit"],
    partnerLoss: json["partnerLoss"]?.toDouble(),
    partnerNetIncome: json["partnerNetIncome"]?.toDouble(),
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
