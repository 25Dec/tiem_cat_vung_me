import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';

abstract class FavoritesRepo {
  ResultFuture<List<ProductEntity>> getFavoritesList();
  ResultFuture<void> toggleFavoritesList({required String productId});
}
