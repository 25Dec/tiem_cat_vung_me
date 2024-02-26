import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../domain/usecases/get_favorites_list.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesList _getFavoritesList;

  FavoritesBloc({required GetFavoritesList getFavoritesList})
      : _getFavoritesList = getFavoritesList,
        super(FavoritesInitial()) {
    on<GetFavoritesListEvent>(_onGetFavoritesListEvent);
  }

  void _onGetFavoritesListEvent(
    GetFavoritesListEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final response = await _getFavoritesList.execute();

    response.fold(
      (failure) => emit(FavoritesErrorState(message: failure.message)),
      (favorites) => emit(DoneGetFavoritesListState(favorites: favorites)),
    );
  }
}
