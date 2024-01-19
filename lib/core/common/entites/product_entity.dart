import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productId;
  final String productName;
  final String? description;
  final Map<String, dynamic> prices;
  final String brand;
  final String productCategory;
  final List<String> imagesUrl;
  final int quantityInStock;
  final int soldQuantity;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductEntity({
    required this.productId,
    required this.productName,
    this.description,
    required this.prices,
    required this.brand,
    required this.productCategory,
    required this.imagesUrl,
    required this.quantityInStock,
    required this.soldQuantity,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [productId, productName];
}
