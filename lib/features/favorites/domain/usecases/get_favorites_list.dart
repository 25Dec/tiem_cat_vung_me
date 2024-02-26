import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/favorites_repo.dart';

class GetFavoritesList {
  final FavoritesRepo _favoritesRepo;

  GetFavoritesList(this._favoritesRepo);
  ResultFuture<List<ProductEntity>> execute() async {
    return await _favoritesRepo.getFavoritesList();
  }
}
