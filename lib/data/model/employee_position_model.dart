// To parse this JSON data, do
//
//     final employeePositionModel = employeePositionModelFromJson(jsonString);

import 'dart:convert';

EmployeePositionModel employeePositionModelFromJson(String str) => EmployeePositionModel.fromJson(json.decode(str));

String employeePositionModelToJson(EmployeePositionModel data) => json.encode(data.toJson());

class EmployeePositionModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  EmployeePositionModel({
    this.success,
    this.message,
    this.data,
  });

  factory EmployeePositionModel.fromJson(Map<String, dynamic> json) => EmployeePositionModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final int? busnId;
  final String? name;

  Datum({
    this.id,
    this.busnId,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    busnId: json["busn_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "busn_id": busnId,
    "name": name,
  };
}
