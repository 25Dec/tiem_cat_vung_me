import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/home_repo.dart';

class GetAllNewProducts {
  final HomeRepo _repo;

  GetAllNewProducts(this._repo);

  ResultFuture<List<ProductEntity>> execute() async {
    return await _repo.getAllNewProducts();
  }
}
