import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String name;
  double price;
  List<String> imageUrls; // dùng List thay vì String
  DateTime? createdAt;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrls,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json, {String? docId}) {
    return Product(
      id: docId,
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrls': imageUrls,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }
}
