// To parse this JSON data, do
//
//     final singleBookModel = singleBookModelFromJson(jsonString);

import 'dart:convert';

SingleBookModel singleBookModelFromJson(String str) => SingleBookModel.fromJson(json.decode(str));

String singleBookModelToJson(SingleBookModel data) => json.encode(data.toJson());

class SingleBookModel {
  final bool? success;
  final String? message;
  final Data? data;

  SingleBookModel({
    this.success,
    this.message,
    this.data,
  });

  factory SingleBookModel.fromJson(Map<String, dynamic> json) => SingleBookModel(
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
  final int? bookId;
  final String? bookName;
  final String? author;
  final String? title;
  final dynamic publisher;
  final dynamic publicationYear;
  final dynamic firstEditionYear;
  final dynamic lastEditionYear;
  final dynamic publisherName;
  final dynamic price;
  final dynamic dedication;
  final dynamic authorBio;
  final dynamic introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;

  Data({
    this.bookId,
    this.bookName,
    this.author,
    this.title,
    this.publisher,
    this.publicationYear,
    this.firstEditionYear,
    this.lastEditionYear,
    this.publisherName,
    this.price,
    this.dedication,
    this.authorBio,
    this.introduction,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.categoryName,
    this.categoryImage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bookId: json["book_id"],
    bookName: json["book_name"],
    author: json["author"],
    title: json["title"],
    publisher: json["publisher"],
    publicationYear: json["publication_year"],
    firstEditionYear: json["first_edition_year"],
    lastEditionYear: json["last_edition_year"],
    publisherName: json["publisher_name"],
    price: json["price"],
    dedication: json["dedication"],
    authorBio: json["author_bio"],
    introduction: json["introduction"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "book_id": bookId,
    "book_name": bookName,
    "author": author,
    "title": title,
    "publisher": publisher,
    "publication_year": publicationYear,
    "first_edition_year": firstEditionYear,
    "last_edition_year": lastEditionYear,
    "publisher_name": publisherName,
    "price": price,
    "dedication": dedication,
    "author_bio": authorBio,
    "introduction": introduction,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
