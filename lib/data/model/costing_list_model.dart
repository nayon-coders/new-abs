// To parse this JSON data, do
//
//     final constingListModel = constingListModelFromJson(jsonString);

import 'dart:convert';

ConstingListModel constingListModelFromJson(String str) => ConstingListModel.fromJson(json.decode(str));

String constingListModelToJson(ConstingListModel data) => json.encode(data.toJson());

class ConstingListModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  ConstingListModel({
    this.success,
    this.message,
    this.data,
  });

  factory ConstingListModel.fromJson(Map<String, dynamic> json) => ConstingListModel(
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
  final String? name;
  final int? busnId;

  Datum({
    this.id,
    this.name,
    this.busnId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    busnId: json["busn_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "busn_id": busnId,
  };
}
