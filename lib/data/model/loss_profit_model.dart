// To parse this JSON data, do
//
//     final lossProfitModel = lossProfitModelFromJson(jsonString);

import 'dart:convert';

LossProfitModel lossProfitModelFromJson(String str) => LossProfitModel.fromJson(json.decode(str));

String lossProfitModelToJson(LossProfitModel data) => json.encode(data.toJson());

class LossProfitModel {
  final bool? success;
  final int? totalSalesRegister;
  final int? totalCreditSales;
  final int? totalSales;
  final int? totalAdditionalIncome;
  final int? toatlOnlineSales;
  final double? totalTax;
  final int? totalSalary;
  final int? foodCost;
  final double? othersCost;
  final int? shortOver;
  final double? totalDabit;
  final int? totalCradit;
  final int? totalProfit;
  final double? totalLoss;
  final double? netIncome;

  LossProfitModel({
    this.success,
    this.totalSalesRegister,
    this.totalCreditSales,
    this.totalSales,
    this.totalAdditionalIncome,
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

  factory LossProfitModel.fromJson(Map<String, dynamic> json) => LossProfitModel(
    success: json["success"],
    totalSalesRegister: json["totalSalesRegister"],
    totalCreditSales: json["totalCreditSales"],
    totalSales: json["totalSales"],
    totalAdditionalIncome: json["totalAdditionalIncome"],
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
    "success": success,
    "totalSalesRegister": totalSalesRegister,
    "totalCreditSales": totalCreditSales,
    "totalSales": totalSales,
    "totalAdditionalIncome": totalAdditionalIncome,
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
