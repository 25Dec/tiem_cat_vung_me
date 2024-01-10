import 'package:equatable/equatable.dart';
import '../../enums/enums.dart';

class ProductEntity extends Equatable {
  final String productId;
  final String productName;
  final String? description;
  final double price;
  final String brand;
  final ProductCategory productCategory;
  final bool isFavorite;
  final String imageUrl;
  final int quantityInStock;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductEntity({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.brand,
    required this.productCategory,
    required this.isFavorite,
    required this.imageUrl,
    required this.quantityInStock,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [productId, productName];
}
