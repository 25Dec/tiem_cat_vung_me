part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent {}

class GetProductDetailsEvent extends ProductDetailsEvent {
  final String id;

  GetProductDetailsEvent({required this.id});
}

class AddToCartEvent extends ProductDetailsEvent {
  final String productId;

  AddToCartEvent({required this.productId});
}

class AddToFavoritesEvent extends ProductDetailsEvent {
  final String productId;

  AddToFavoritesEvent({required this.productId});
}
