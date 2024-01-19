import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/home_repo.dart';

class GetAllProducts {
  final HomeRepo _repo;

  GetAllProducts(this._repo);

  ResultFuture<List<ProductEntity>> execute() async {
    return await _repo.getAllProducts();
  }
}
