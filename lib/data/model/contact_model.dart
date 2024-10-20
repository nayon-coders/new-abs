// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  final bool? success;
  final String? message;
  final Data? data;

  ContactModel({
    this.success,
    this.message,
    this.data,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
  final String? email;
  final String? phone;
  final String? facebook;
  final String? whatsapp;
  final String? instagram;
  final String? twitter;

  Data({
    this.id,
    this.email,
    this.phone,
    this.facebook,
    this.whatsapp,
    this.instagram,
    this.twitter,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    facebook: json["facebook"],
    whatsapp: json["whatsapp"],
    instagram: json["instagram"],
    twitter: json["twitter"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "facebook": facebook,
    "whatsapp": whatsapp,
    "instagram": instagram,
    "twitter": twitter,
  };
}
