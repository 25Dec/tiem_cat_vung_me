import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';

abstract class HomeRepo {
  ResultFuture<List<ProductEntity>> getAllProducts();
}
