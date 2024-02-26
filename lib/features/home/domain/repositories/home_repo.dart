import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';

abstract class HomeRepo {
  ResultFuture<List<ProductEntity>> getAllNewProducts();
  ResultFuture<List<ProductEntity>> getAllBestSellingProducts();
  ResultFuture<List<ProductEntity>> getAllProductsSortedByPrice({
    required bool isPriceAsc,
  });
  ResultFuture<List<ProductEntity>> getProductsByFilter({
    required List<String> options,
  });
}
