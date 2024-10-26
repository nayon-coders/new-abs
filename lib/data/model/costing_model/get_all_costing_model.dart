// To parse this JSON data, do
//
//     final getAllCostingModel = getAllCostingModelFromJson(jsonString);

import 'dart:convert';

GetAllCostingModel getAllCostingModelFromJson(String str) => GetAllCostingModel.fromJson(json.decode(str));

String getAllCostingModelToJson(GetAllCostingModel data) => json.encode(data.toJson());

class GetAllCostingModel {
  final bool? success;
  final String? message;
  final int? totalCostings;
  final double? totalCostingsAmount;
  final List<SingleCosting>? data;

  GetAllCostingModel({
    this.success,
    this.message,
    this.totalCostings,
    this.totalCostingsAmount,
    this.data,
  });

  factory GetAllCostingModel.fromJson(Map<String, dynamic> json) => GetAllCostingModel(
    success: json["success"],
    message: json["message"],
    totalCostings: json["totalCostings"],
    totalCostingsAmount: json["totalCostingsAmount"]?.toDouble(),
    data: json["data"] == null ? [] : List<SingleCosting>.from(json["data"]!.map((x) => SingleCosting.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalCostings": totalCostings,
    "totalCostingsAmount": totalCostingsAmount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleCosting {
  final int? id;
  final String? costName;
  final String? amount;
  final DateTime? date;
  final int? busnId;

  SingleCosting({
    this.id,
    this.costName,
    this.amount,
    this.date,
    this.busnId,
  });

  factory SingleCosting.fromJson(Map<String, dynamic> json) => SingleCosting(
    id: json["id"],
    costName: json["costName"],
    amount: json["amount"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    busnId: json["busn_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "costName": costName,
    "amount": amount,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "busn_id": busnId,
  };
}
