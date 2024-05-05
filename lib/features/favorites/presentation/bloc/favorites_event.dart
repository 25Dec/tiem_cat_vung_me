part of 'favorites_bloc.dart';

abstract class FavoritesEvent {}

class GetFavoritesListEvent extends FavoritesEvent {}

class ToggleFavoritesListEvent extends FavoritesEvent {
  final String productId;

  ToggleFavoritesListEvent({required this.productId});
}
