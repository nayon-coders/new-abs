// To parse this JSON data, do
//
//     final foodCostModel = foodCostModelFromJson(jsonString);

import 'dart:convert';

FoodCostModel foodCostModelFromJson(String str) => FoodCostModel.fromJson(json.decode(str));

String foodCostModelToJson(FoodCostModel data) => json.encode(data.toJson());

class FoodCostModel {
  final bool? success;
  final String? message;
  final int? totalFoodCost;
  final int? totalFoodCostAmount;
  final List<FoodCostResult>? result;

  FoodCostModel({
    this.success,
    this.message,
    this.totalFoodCost,
    this.totalFoodCostAmount,
    this.result,
  });

  factory FoodCostModel.fromJson(Map<String, dynamic> json) => FoodCostModel(
    success: json["success"],
    message: json["message"],
    totalFoodCost: json["totalFoodCost"],
    totalFoodCostAmount: json["totalFoodCostAmount"],
    result: json["result"] == null ? [] : List<FoodCostResult>.from(json["result"]!.map((x) => FoodCostResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalFoodCost": totalFoodCost,
    "totalFoodCostAmount": totalFoodCostAmount,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class FoodCostResult {
  final int? id;
  final String? name;
  final DateTime? date;
  final int? busnId;
  final List<Datum>? data;

  FoodCostResult({
    this.id,
    this.name,
    this.date,
    this.busnId,
    this.data,
  });

  factory FoodCostResult.fromJson(Map<String, dynamic> json) => FoodCostResult(
    id: json["id"],
    name: json["name"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    busnId: json["busn_id"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "busn_id": busnId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final int? foodCostId;
  final String? vendorName;
  final String? vendorAmount;
  final String? payBy;
  final String? checkNo;

  Datum({
    this.id,
    this.foodCostId,
    this.vendorName,
    this.vendorAmount,
    this.payBy,
    this.checkNo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    foodCostId: json["food_cost_id"],
    vendorName: json["vendor_name"],
    vendorAmount: json["vendor_amount"],
    payBy: json["pay_by"],
    checkNo: json["checkNo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "food_cost_id": foodCostId,
    "vendor_name": vendorName,
    "vendor_amount": vendorAmount,
    "pay_by": payBy,
    "checkNo": checkNo,
  };
}
