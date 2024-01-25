part of 'product_details_bloc.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class GettingProductDetailsState extends ProductDetailsState {}

class DoneGetProductDetailsState extends ProductDetailsState {
  final ProductEntity product;

  DoneGetProductDetailsState(this.product);
}

class AddedToCartState extends ProductDetailsState {}

class AddedToFavoritesState extends ProductDetailsState {}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError({required this.message});
}
