// To parse this JSON data, do
//
//     final allBooksModel = allBooksModelFromJson(jsonString);

import 'dart:convert';

AllBooksModel allBooksModelFromJson(String str) => AllBooksModel.fromJson(json.decode(str));

String allBooksModelToJson(AllBooksModel data) => json.encode(data.toJson());

class AllBooksModel {
  final bool? success;
  final String? message;
  final int? totalBooks;
  final List<Datum>? data;

  AllBooksModel({
    this.success,
    this.message,
    this.totalBooks,
    this.data,
  });

  factory AllBooksModel.fromJson(Map<String, dynamic> json) => AllBooksModel(
    success: json["success"],
    message: json["message"],
    totalBooks: json["totalBooks"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "totalBooks": totalBooks,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? bookId;
  final String? bookName;
  final String? author;
  final String? title;
  final String? publisher;
  final String? publicationYear;
  final String? firstEditionYear;
  final String? lastEditionYear;
  final String? publisherName;
  final int? price;
  final String? dedication;
  final String? authorBio;
  final String? introduction;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? categoryId;
  final String? categoryName;
  final String? categoryImage;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
