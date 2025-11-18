// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  int id;
  String name;
  int price;
  String description;
  String category;
  String thumbnail;
  bool isFeatured;
  int stock;
  double rating;
  bool isProductPopular;
  int? userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.isFeatured,
    required this.stock,
    required this.rating,
    required this.isProductPopular,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    isFeatured: json["is_featured"],
    stock: json["stock"],
    rating: json["rating"]?.toDouble(),
    isProductPopular: json["is_product_popular"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
    "stock": stock,
    "rating": rating,
    "is_product_popular": isProductPopular,
    "user_id": userId,
  };
}
