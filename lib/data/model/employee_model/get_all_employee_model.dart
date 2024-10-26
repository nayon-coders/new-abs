import 'dart:convert';

EmployeeListModel employeeListModelFromJson(String str) => EmployeeListModel.fromJson(json.decode(str));

String employeeListModelToJson(EmployeeListModel data) => json.encode(data.toJson());

class EmployeeListModel {
  final bool? success;
  final String? message;
  final int? totalEmployees;
  final List<SingleEmployee>? data;

  EmployeeListModel({
    this.success,
    this.message,
    this.totalEmployees,
    this.data,
  });

  factory EmployeeListModel.fromJson(Map<String, dynamic> json) => EmployeeListModel(
    success: json["success"],
    message: json["message"],
    totalEmployees: json["totalEmployees"],
    data: json["data"] == null ? [] : List<SingleEmployee>.from(json["data"]!.map((x) => SingleEmployee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalEmployees": totalEmployees,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SingleEmployee {
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
  final int? historyId;
  final int? employeeId;
  final String? profilePic;
  final String? address;
  final String? joiningDate;
  final int? totalHoursWorked;
  final int? totalAmountPaid;
  final int? totalClockIn;

  SingleEmployee({
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
    this.historyId,
    this.employeeId,
    this.profilePic,
    this.address,
    this.joiningDate,
    this.totalHoursWorked,
    this.totalAmountPaid,
    this.totalClockIn,
  });

  factory SingleEmployee.fromJson(Map<String, dynamic> json) => SingleEmployee(
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
    historyId: json["history_id"],
    employeeId: json["employee_id"],
    profilePic: json["profilePic"],
    address: json["address"],
    joiningDate: json["joiningDate"],
    totalHoursWorked: json["total_hours_worked"],
    totalAmountPaid: json["total_amount_paid"],
    totalClockIn: json["total_clock_in"],
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
    "history_id": historyId,
    "employee_id": employeeId,
    "profilePic": profilePic,
    "address": address,
    "joiningDate": joiningDate,
    "total_hours_worked": totalHoursWorked,
    "total_amount_paid": totalAmountPaid,
    "total_clock_in": totalClockIn,
  };
}