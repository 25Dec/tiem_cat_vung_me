import 'package:cloud_firestore/cloud_firestore.dart';

import '../entites/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.productId,
    required super.productName,
    super.description,
    required super.prices,
    required super.brand,
    required super.productCategory,
    required super.imagesUrl,
    required super.quantityInStock,
    required super.soldQuantity,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["productId"] as String,
      productName: json["productName"] as String,
      description: json["description"] as String,
      prices: json["prices"],
      brand: json["brand"] as String,
      productCategory: json["productCategory"] as String,
      imagesUrl: List<String>.from(json["imagesUrl"]),
      quantityInStock: json["quantityInStock"] as int,
      soldQuantity: json["soldQuantity"] as int,
      createdAt: (json["createdAt"] as Timestamp).toDate(),
      updatedAt: (json["updatedAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productName": productName,
      "description": description,
      "prices": prices,
      "brand": brand,
      "productCategory": productCategory,
      "imagesUrl": imagesUrl,
      "quantityInStock": quantityInStock,
      "soldQuantity": soldQuantity,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
