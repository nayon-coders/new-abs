// To parse this JSON data, do
//
//     final salaryListModel = salaryListModelFromJson(jsonString);

import 'dart:convert';

SalaryListModel salaryListModelFromJson(String str) => SalaryListModel.fromJson(json.decode(str));

String salaryListModelToJson(SalaryListModel data) => json.encode(data.toJson());

class SalaryListModel {
  final bool? success;
  final String? message;
  final int? totalSalaries;
  final double? totalSalariesAmount;
  final List<SalaryItem>? data;

  SalaryListModel({
    this.success,
    this.message,
    this.totalSalaries,
    this.totalSalariesAmount,
    this.data,
  });

  factory SalaryListModel.fromJson(Map<String, dynamic> json) => SalaryListModel(
    success: json["success"],
    message: json["message"],
    totalSalaries: json["totalSalaries"],
    totalSalariesAmount: json["totalSalariesAmount"]?.toDouble(),
    data: json["data"] == null ? [] : List<SalaryItem>.from(json["data"]!.map((x) => SalaryItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalSalaries": totalSalaries,
    "totalSalariesAmount": totalSalariesAmount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SalaryItem {
  final int? id;
  final String? employeeId;
  final String? amount;
  final String? payBy;
  final String? date;
  final int? busnId;
  final String? employeeName;
  final String? checkNo;

  SalaryItem({
    this.id,
    this.employeeId,
    this.amount,
    this.payBy,
    this.date,
    this.busnId,
    this.employeeName,
    this.checkNo
  });

  factory SalaryItem.fromJson(Map<String, dynamic> json) => SalaryItem(
    id: json["id"],
    employeeId: json["employeeID"],
    amount: json["amount"],
    payBy: json["payBy"],
    date: json["date"],
    busnId: json["busn_id"],
    employeeName: json["employeeName"],
    checkNo: json["check_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeID": employeeId,
    "amount": amount,
    "payBy": payBy,
    "date": "${date!}",
    "busn_id": busnId,
    "employeeName": employeeName,
    "check_no" : checkNo
  };
}
