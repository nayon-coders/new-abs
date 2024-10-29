// To parse this JSON data, do
//
//     final getSinglePartnerModel = getSinglePartnerModelFromJson(jsonString);

import 'dart:convert';

GetSinglePartnerModel getSinglePartnerModelFromJson(String str) => GetSinglePartnerModel.fromJson(json.decode(str));

String getSinglePartnerModelToJson(GetSinglePartnerModel data) => json.encode(data.toJson());

class GetSinglePartnerModel {
  final bool? success;
  final PartnerInfo? partnerInfo;
  final WholeBusiness? wholeBusiness;

  GetSinglePartnerModel({
    this.success,
    this.partnerInfo,
    this.wholeBusiness,
  });

  factory GetSinglePartnerModel.fromJson(Map<String, dynamic> json) => GetSinglePartnerModel(
    success: json["success"],
    partnerInfo: json["partnerInfo"] == null ? null : PartnerInfo.fromJson(json["partnerInfo"]),
    wholeBusiness: json["wholeBusiness"] == null ? null : WholeBusiness.fromJson(json["wholeBusiness"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "partnerInfo": partnerInfo?.toJson(),
    "wholeBusiness": wholeBusiness?.toJson(),
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
    percentage: json["percentage"],
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

class WholeBusiness {
  final dynamic? totalCreditSales;
  final dynamic totalAdditionalIncome;
  final dynamic totalSales;
  final dynamic toatlOnlineSales;
  final dynamic? totalTax;
  final dynamic? totalSalary;
  final dynamic? foodCost;
  final dynamic? othersCost;
  final dynamic? shortOver;
  final dynamic? totalDabit;
  final dynamic? totalCradit;
  final dynamic? totalProfit;
  final dynamic? totalLoss;
  final dynamic? netIncome;

  WholeBusiness({
    this.totalCreditSales,
    this.totalAdditionalIncome,
    this.totalSales,
    this.toatlOnlineSales,
    this.totalTax,
    this.totalSalary,
    this.foodCost,
    this.othersCost,
    this.shortOver,
    this.totalDabit,
    this.totalCradit,
    this.totalProfit,
    this.totalLoss,
    this.netIncome,
  });

  factory WholeBusiness.fromJson(Map<String, dynamic> json) => WholeBusiness(
    totalCreditSales: json["totalCreditSales"],
    totalAdditionalIncome: json["totalAdditionalIncome"],
    totalSales: json["totalSales"],
    toatlOnlineSales: json["toatlOnlineSales"],
    totalTax: json["totalTax"]?.toDouble(),
    totalSalary: json["totalSalary"],
    foodCost: json["foodCost"],
    othersCost: json["othersCost"]?.toDouble(),
    shortOver: json["shortOver"],
    totalDabit: json["totalDabit"]?.toDouble(),
    totalCradit: json["totalCradit"],
    totalProfit: json["totalProfit"],
    totalLoss: json["totalLoss"]?.toDouble(),
    netIncome: json["netIncome"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "totalCreditSales": totalCreditSales,
    "totalAdditionalIncome": totalAdditionalIncome,
    "totalSales": totalSales,
    "toatlOnlineSales": toatlOnlineSales,
    "totalTax": totalTax,
    "totalSalary": totalSalary,
    "foodCost": foodCost,
    "othersCost": othersCost,
    "shortOver": shortOver,
    "totalDabit": totalDabit,
    "totalCradit": totalCradit,
    "totalProfit": totalProfit,
    "totalLoss": totalLoss,
    "netIncome": netIncome,
  };
}
