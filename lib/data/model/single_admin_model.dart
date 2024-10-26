// To parse this JSON data, do
//
//     final singleAdminModel = singleAdminModelFromJson(jsonString);

import 'dart:convert';

SingleAdminModel singleAdminModelFromJson(String str) => SingleAdminModel.fromJson(json.decode(str));

String singleAdminModelToJson(SingleAdminModel data) => json.encode(data.toJson());

class SingleAdminModel {
  final int? id;
  final int? businessId;
  final String? businessName;
  final String? businessAddress;
  final String? name;
  final String? email;
  final String? password;
  final int? emailPin;
  final String? phone;
  final String? type;
  final String? employeeType;
  final String? employeePosition;
  final String? salaryType;
  final dynamic salaryRate;
  final String? status;
  final String? totalAmountEarn;
  final String? totalClockIn;
  final int? totalPayment;
  final int? duePayment;
  final String? address;
  final String? profilePic;
  final String? joiningDate;

  SingleAdminModel({
    this.id,
    this.businessId,
    this.businessName,
    this.businessAddress,
    this.name,
    this.email,
    this.password,
    this.emailPin,
    this.phone,
    this.type,
    this.employeeType,
    this.employeePosition,
    this.salaryType,
    this.salaryRate,
    this.status,
    this.totalAmountEarn,
    this.totalClockIn,
    this.totalPayment,
    this.duePayment,
    this.address,
    this.profilePic,
    this.joiningDate,
  });

  factory SingleAdminModel.fromJson(Map<String, dynamic> json) => SingleAdminModel(
    id: json["id"],
    businessId: json["business_id"],
    businessName: json["business_name"],
    businessAddress: json["business_address"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    emailPin: json["emailPin"],
    phone: json["phone"],
    type: json["type"],
    employeeType: json["employeeType"],
    employeePosition: json["employeePosition"],
    salaryType: json["salaryType"],
    salaryRate: json["salaryRate"],
    status: json["status"],
    totalAmountEarn: json["total_amount_earn"],
    totalClockIn: json["total_clock_in"],
    totalPayment: json["total_payment"],
    duePayment: json["due_payment"],
    address: json["address"],
    profilePic: json["profilePic"],
    joiningDate: json["joiningDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "business_name": businessName,
    "business_address": businessAddress,
    "name": name,
    "email": email,
    "password": password,
    "emailPin": emailPin,
    "phone": phone,
    "type": type,
    "employeeType": employeeType,
    "employeePosition": employeePosition,
    "salaryType": salaryType,
    "salaryRate": salaryRate,
    "status": status,
    "total_amount_earn": totalAmountEarn,
    "total_clock_in": totalClockIn,
    "total_payment": totalPayment,
    "due_payment": duePayment,
    "address": address,
    "profilePic": profilePic,
    "joiningDate": joiningDate,
  };
}
