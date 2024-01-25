import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';

abstract class ProductDetailsRepo {
  ResultFuture<ProductEntity> getProductDetails(String id);
  ResultFuture<void> addToCart();
  ResultFuture<void> addToFavorites();
}
