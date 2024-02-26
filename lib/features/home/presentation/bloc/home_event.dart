part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetAllNewProductsEvent extends HomeEvent {}

class GetAllBestSellingProductsEvent extends HomeEvent {}

class GetAllProductsSortedByPriceEvent extends HomeEvent {
  final bool isPriceAsc;

  GetAllProductsSortedByPriceEvent({required this.isPriceAsc});
}

class GetProductsByFilterEvent extends HomeEvent {
  final List<String> options;

  GetProductsByFilterEvent({required this.options});
}
