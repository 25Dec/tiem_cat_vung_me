import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/home_repo.dart';

class GetProductsByFilter {
  final HomeRepo _repo;

  GetProductsByFilter(this._repo);

  ResultFuture<List<ProductEntity>> execute({required List<String> options}) async {
    return await _repo.getProductsByFilter(options: options);
  }
}
