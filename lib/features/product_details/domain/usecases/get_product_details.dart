import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/utils/typedefs.dart';
import '../repositories/product_details_repo.dart';

class GetProductDetails {
  final ProductDetailsRepo _repo;

  GetProductDetails(this._repo);

  ResultFuture<ProductEntity> execute({required String id}) async {
    return await _repo.getProductDetails(id: id);
  }
}
