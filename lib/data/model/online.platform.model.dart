// To parse this JSON data, do
//
//     final onlineSalesPlatformModel = onlineSalesPlatformModelFromJson(jsonString);

import 'dart:convert';

OnlineSalesPlatformModel onlineSalesPlatformModelFromJson(String str) => OnlineSalesPlatformModel.fromJson(json.decode(str));

String onlineSalesPlatformModelToJson(OnlineSalesPlatformModel data) => json.encode(data.toJson());

class OnlineSalesPlatformModel {
  final bool? success;
  final String? message;
  final List<OnlinePlatforms>? data;

  OnlineSalesPlatformModel({
    this.success,
    this.message,
    this.data,
  });

  factory OnlineSalesPlatformModel.fromJson(Map<String, dynamic> json) => OnlineSalesPlatformModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<OnlinePlatforms>.from(json["data"]!.map((x) => OnlinePlatforms.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OnlinePlatforms {
  final int? id;
  final int? busnId;
  final String? name;

  OnlinePlatforms({
    this.id,
    this.busnId,
    this.name,
  });

  factory OnlinePlatforms.fromJson(Map<String, dynamic> json) => OnlinePlatforms(
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
