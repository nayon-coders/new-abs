// To parse this JSON data, do
//
//     final lossProfitModel = lossProfitModelFromJson(jsonString);

import 'dart:convert';

LossProfitModel lossProfitModelFromJson(String str) => LossProfitModel.fromJson(json.decode(str));

String lossProfitModelToJson(LossProfitModel data) => json.encode(data.toJson());

class LossProfitModel {
  final bool? success;
  final int? netSales;
  final int? lossProfitModelTotalSales;
  final int? lossProfit;
  final int? totalSalesRegister;
  final int? totalCreditSales;
  final int? totalSales;
  final int? totalAdditionalIncome;
  final int? toatlOnlineSales;
  final int? totalTax;
  final int? totalSalary;
  final int? foodCost;
  final int? othersCost;
  final int? shortOver;
  final int? totalDabit;
  final int? totalCradit;
  final int? totalProfit;
  final int? totalLoss;
  final int? netIncome;

  LossProfitModel({
    this.success,
    this.netSales,
    this.lossProfitModelTotalSales,
    this.lossProfit,
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
    netSales: json["net_sales"],
    lossProfitModelTotalSales: json["total_sales"],
    lossProfit: json["loss_profit"],
    totalSalesRegister: json["totalSalesRegister"],
    totalCreditSales: json["totalCreditSales"],
    totalSales: json["totalSales"],
    totalAdditionalIncome: json["totalAdditionalIncome"],
    toatlOnlineSales: json["toatlOnlineSales"],
    totalTax: json["totalTax"],
    totalSalary: json["totalSalary"],
    foodCost: json["foodCost"],
    othersCost: json["othersCost"],
    shortOver: json["shortOver"],
    totalDabit: json["totalDabit"],
    totalCradit: json["totalCradit"],
    totalProfit: json["totalProfit"],
    totalLoss: json["totalLoss"],
    netIncome: json["netIncome"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "net_sales": netSales,
    "total_sales": lossProfitModelTotalSales,
    "loss_profit": lossProfit,
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
