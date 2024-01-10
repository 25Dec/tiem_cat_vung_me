import 'package:tiem_cat_vung_me/core/common/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.productId,
      required super.productName,
      required super.description,
      required super.price,
      required super.brand,
      required super.productCategory,
      required super.isFavorite,
      required super.imageUrl,
      required super.quantityInStock,
      required super.createdAt,
      required super.updatedAt});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json["productId"],
      productName: json["productName"],
      description: json["description"],
      price: json["price"],
      brand: json["brand"],
      productCategory: json["productCategory"],
      isFavorite: json["isFavorite"],
      imageUrl: json["imageUrl"],
      quantityInStock: json["quantityInStock"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productName": productName,
      "description": description,
      "price": price,
      "brand": brand,
      "productCategory": productCategory,
      "isFavorite": isFavorite,
      "imageUrl": imageUrl,
      "quantityInStock": quantityInStock,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
