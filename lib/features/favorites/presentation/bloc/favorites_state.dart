part of 'favorites_bloc.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class DoneGetFavoritesListState extends FavoritesState {
  final List<ProductEntity> favorites;

  DoneGetFavoritesListState({required this.favorites});
}

class AddedToFavoritesListState extends FavoritesState {}

class FavoritesErrorState extends FavoritesState {
  final String message;

  FavoritesErrorState({required this.message});
}
