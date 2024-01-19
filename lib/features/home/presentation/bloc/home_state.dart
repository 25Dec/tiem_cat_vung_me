part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GettingAllProductsState extends HomeState {}

class DoneGetAllProductsState extends HomeState {
  final List<ProductEntity> products;

  DoneGetAllProductsState({required this.products});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
