// To parse this JSON data, do
//
//     final onlienSalesRepotModel = onlienSalesRepotModelFromJson(jsonString);

import 'dart:convert';

OnlienSalesRepotModel onlienSalesRepotModelFromJson(String str) => OnlienSalesRepotModel.fromJson(json.decode(str));

String onlienSalesRepotModelToJson(OnlienSalesRepotModel data) => json.encode(data.toJson());

class OnlienSalesRepotModel {
  final bool? success;
  final String? message;
  final String? totalOnlineSales;
  final List<Datum>? data;

  OnlienSalesRepotModel({
    this.success,
    this.message,
    this.totalOnlineSales,
    this.data,
  });

  factory OnlienSalesRepotModel.fromJson(Map<String, dynamic> json) => OnlienSalesRepotModel(
    success: json["success"],
    message: json["message"],
    totalOnlineSales: json["totalOnlineSales"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalOnlineSales": totalOnlineSales,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? name;
  final String? amount;

  Datum({
    this.name,
    this.amount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
  };
}
