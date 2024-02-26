import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/home_repo.dart';

class GetAllBestSellingProducts {
  final HomeRepo _repo;

  GetAllBestSellingProducts(this._repo);

  ResultFuture<List<ProductEntity>> execute() async {
    return await _repo.getAllBestSellingProducts();
  }
}
