import '../../../../core/utils/typedefs.dart';
import '../repositories/favorites_repo.dart';

class ToggleFavoritesList {
  final FavoritesRepo _repo;

  ToggleFavoritesList(this._repo);

  ResultFuture<void> execute({required String productId}) async {
    return await _repo.toggleFavoritesList(productId: productId);
  }
}
