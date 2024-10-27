// To parse this JSON data, do
//
//     final allCostListModel = allCostListModelFromJson(jsonString);

import 'dart:convert';

AllCostListModel allCostListModelFromJson(String str) => AllCostListModel.fromJson(json.decode(str));

String allCostListModelToJson(AllCostListModel data) => json.encode(data.toJson());

class AllCostListModel {
  final bool? success;
  final String? message;
  final int? totalCostings;
  final double? totalCostingsAmount;
  final List<SingleCostingModel>? data;

  AllCostListModel({
    this.success,
    this.message,
    this.totalCostings,
    this.totalCostingsAmount,
    this.data,
  });

  factory AllCostListModel.fromJson(Map<String, dynamic> json) => AllCostListModel(
    success: json["success"],
    message: json["message"],
    totalCostings: json["totalCostings"],
    totalCostingsAmount: json["totalCostingsAmount"]?.toDouble(),
    data: json["data"] == null ? [] : List<SingleCostingModel>.from(json["data"]!.map((x) => SingleCostingModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalCostings": totalCostings,
    "totalCostingsAmount": totalCostingsAmount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleCostingModel {
  final int? id;
  final String? costName;
  final String? amount;
  final DateTime? date;
  final int? busnId;

  SingleCostingModel({
    this.id,
    this.costName,
    this.amount,
    this.date,
    this.busnId,
  });

  factory SingleCostingModel.fromJson(Map<String, dynamic> json) => SingleCostingModel(
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
