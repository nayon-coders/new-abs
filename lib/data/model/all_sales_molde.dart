// To parse this JSON data, do
//
//     final allSalesModel = allSalesModelFromJson(jsonString);

import 'dart:convert';

AllSalesModel allSalesModelFromJson(String str) => AllSalesModel.fromJson(json.decode(str));

String allSalesModelToJson(AllSalesModel data) => json.encode(data.toJson());

class AllSalesModel {
  final bool? success;
  final String? message;
  final int? totalSales;
  final int? totalSalesAmount;
  final List<SingleSalesDatum>? data;

  AllSalesModel({
    this.success,
    this.message,
    this.totalSales,
    this.totalSalesAmount,
    this.data,
  });

  factory AllSalesModel.fromJson(Map<String, dynamic> json) => AllSalesModel(
    success: json["success"],
    message: json["message"],
    totalSales: json["totalSales"],
    totalSalesAmount: json["totalSalesAmount"],
    data: json["data"] == null ? [] : List<SingleSalesDatum>.from(json["data"]!.map((x) => SingleSalesDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalSales": totalSales,
    "totalSalesAmount": totalSalesAmount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleSalesDatum {
  final int? id;
  final String? salesRegister;
  final String? totalCashCollect;
  final String? craditeSales;
  final String? soOv;
  final DateTime? date;
  final int? busnId;
  final dynamic? tax;
  final int? additionalIncome;
  final List<OnlineSale>? onlineSales;

  SingleSalesDatum({
    this.id,
    this.salesRegister,
    this.totalCashCollect,
    this.craditeSales,
    this.soOv,
    this.date,
    this.busnId,
    this.tax,
    this.additionalIncome,
    this.onlineSales,
  });

  factory SingleSalesDatum.fromJson(Map<String, dynamic> json) => SingleSalesDatum(
    id: json["id"],
    salesRegister: json["salesRegister"],
    totalCashCollect: json["totalCashCollect"],
    craditeSales: json["craditeSales"],
    soOv: json["so_ov"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    busnId: json["busn_id"],
    tax: json["tax"],
    additionalIncome: json["additional_income"],
    onlineSales: json["onlineSales"] == null ? [] : List<OnlineSale>.from(json["onlineSales"]!.map((x) => OnlineSale.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "salesRegister": salesRegister,
    "totalCashCollect": totalCashCollect,
    "craditeSales": craditeSales,
    "so_ov": soOv,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "busn_id": busnId,
    "tax": tax,
    "additional_income": additionalIncome,
    "onlineSales": onlineSales == null ? [] : List<dynamic>.from(onlineSales!.map((x) => x.toJson())),
  };
}

class OnlineSale {
  final int? id;
  final int? salesId;
  final String? name;
  final String? amount;

  OnlineSale({
    this.id,
    this.salesId,
    this.name,
    this.amount,
  });

  factory OnlineSale.fromJson(Map<String, dynamic> json) => OnlineSale(
    id: json["id"],
    salesId: json["sales_id"],
    name: json["name"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sales_id": salesId,
    "name": name,
    "amount": amount,
  };
}

