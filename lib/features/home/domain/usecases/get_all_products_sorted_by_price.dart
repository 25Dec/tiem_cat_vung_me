import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/home_repo.dart';

class GetAllProductsSortedByPrice {
  final HomeRepo _repo;

  GetAllProductsSortedByPrice(this._repo);

  ResultFuture<List<ProductEntity>> execute({required bool isPriceAsc}) async {
    return await _repo.getAllProductsSortedByPrice(isPriceAsc: isPriceAsc);
  }
}
