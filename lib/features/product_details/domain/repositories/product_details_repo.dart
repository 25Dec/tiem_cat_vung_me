import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';

abstract class ProductDetailsRepo {
  ResultFuture<ProductEntity> getProductDetails({required String id});
  ResultFuture<void> addToCart({required String productId});
  ResultFuture<void> addToFavorites({required String productId});
}
