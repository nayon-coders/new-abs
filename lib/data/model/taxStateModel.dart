// To parse this JSON data, do
//
//     final taxStateModel = taxStateModelFromJson(jsonString);

import 'dart:convert';

TaxStateModel taxStateModelFromJson(String str) => TaxStateModel.fromJson(json.decode(str));

String taxStateModelToJson(TaxStateModel data) => json.encode(data.toJson());

class TaxStateModel {
  final bool? success;
  final String? message;
  final Data? data;

  TaxStateModel({
    this.success,
    this.message,
    this.data,
  });

  factory TaxStateModel.fromJson(Map<String, dynamic> json) => TaxStateModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? id;
  final int? tax;
  final String? state;
  final int? busnId;

  Data({
    this.id,
    this.tax,
    this.state,
    this.busnId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    tax: json["tax"],
    state: json["state"],
    busnId: json["busn_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tax": tax,
    "state": state,
    "busn_id": busnId,
  };
}
