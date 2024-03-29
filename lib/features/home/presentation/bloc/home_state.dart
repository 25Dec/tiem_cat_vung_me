part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class DoneGetProductsState extends HomeState {
  final List<ProductEntity> products;

  DoneGetProductsState({required this.products});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
