// To parse this JSON data, do
//
//     final singleEmployeeModel = singleEmployeeModelFromJson(jsonString);

import 'dart:convert';

SingleEmployeeModel singleEmployeeModelFromJson(String str) => SingleEmployeeModel.fromJson(json.decode(str));

String singleEmployeeModelToJson(SingleEmployeeModel data) => json.encode(data.toJson());

class SingleEmployeeModel {
  final bool? success;
  final Employee? employee;
  final String? selectedMonthTotalAmount;
  final String? selectedMonthTotalWorkTime;
  final int? selectedMonthTotalPayment;
  final int? selectedMontDueAmount;
  final List<dynamic>? workingHistory;
  final List<dynamic>? paymentHistory;

  SingleEmployeeModel({
    this.success,
    this.employee,
    this.selectedMonthTotalAmount,
    this.selectedMonthTotalWorkTime,
    this.selectedMonthTotalPayment,
    this.selectedMontDueAmount,
    this.workingHistory,
    this.paymentHistory,
  });

  factory SingleEmployeeModel.fromJson(Map<String, dynamic> json) => SingleEmployeeModel(
    success: json["success"],
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
    selectedMonthTotalAmount: json["selectedMonthTotalAmount"],
    selectedMonthTotalWorkTime: json["selectedMonthTotalWorkTime"],
    selectedMonthTotalPayment: json["selectedMonthTotalPayment"],
    selectedMontDueAmount: json["selectedMontDueAmount"],
    workingHistory: json["working_history"] == null ? [] : List<dynamic>.from(json["working_history"]!.map((x) => x)),
    paymentHistory: json["payment_history"] == null ? [] : List<dynamic>.from(json["payment_history"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "employee": employee?.toJson(),
    "selectedMonthTotalAmount": selectedMonthTotalAmount,
    "selectedMonthTotalWorkTime": selectedMonthTotalWorkTime,
    "selectedMonthTotalPayment": selectedMonthTotalPayment,
    "selectedMontDueAmount": selectedMontDueAmount,
    "working_history": workingHistory == null ? [] : List<dynamic>.from(workingHistory!.map((x) => x)),
    "payment_history": paymentHistory == null ? [] : List<dynamic>.from(paymentHistory!.map((x) => x)),
  };
}

class Employee {
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
  final String? salaryRate;
  final String? status;
  final String? totalAmountEarn;
  final String? totalClockIn;
  final int? totalPayment;
  final int? duePayment;
  final String? address;
  final String? profilePic;
  final String? joiningDate;

  Employee({
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

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
