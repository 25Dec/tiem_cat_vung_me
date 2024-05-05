import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../domain/usecases/get_favorites_list.dart';
import '../../domain/usecases/toggle_favorites_list.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesList _getFavoritesList;
  final ToggleFavoritesList _toggleFavoritesList;

  FavoritesBloc({
    required GetFavoritesList getFavoritesList,
    required ToggleFavoritesList toggleFavoritesList,
  })  : _getFavoritesList = getFavoritesList,
        _toggleFavoritesList = toggleFavoritesList,
        super(FavoritesInitial()) {
    on<GetFavoritesListEvent>(_onGetFavoritesListEvent);
    on<ToggleFavoritesListEvent>(_onToggleFavoritesListEvent);
  }

  void _onGetFavoritesListEvent(
    GetFavoritesListEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final response = await _getFavoritesList.execute();
    print("listened");
    response.fold(
      (failure) => emit(FavoritesErrorState(message: failure.message)),
      (favorites) => emit(DoneGetFavoritesListState(favorites: favorites)),
    );
  }

  void _onToggleFavoritesListEvent(
    ToggleFavoritesListEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final response = await _toggleFavoritesList.execute(productId: event.productId);

    response.fold(
      (failure) => emit(FavoritesErrorState(message: failure.message)),
      (favorites) => emit(AddedToFavoritesListState()),
    );
  }
}
