// To parse this JSON data, do
//
//     final credicardFeeModel = credicardFeeModelFromJson(jsonString);

import 'dart:convert';

CredicardFeeModel credicardFeeModelFromJson(String str) => CredicardFeeModel.fromJson(json.decode(str));

String credicardFeeModelToJson(CredicardFeeModel data) => json.encode(data.toJson());

class CredicardFeeModel {
  final bool? success;
  final String? message;
  final Data? data;

  CredicardFeeModel({
    this.success,
    this.message,
    this.data,
  });

  factory CredicardFeeModel.fromJson(Map<String, dynamic> json) => CredicardFeeModel(
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
  final int? busnId;
  final double? fee;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.busnId,
    this.fee,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    busnId: json["busn_id"],
    fee: json["fee"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "busn_id": busnId,
    "fee": fee,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
