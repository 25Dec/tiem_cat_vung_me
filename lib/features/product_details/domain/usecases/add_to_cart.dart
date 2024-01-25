import '../../../../core/utils/typedefs.dart';
import '../repositories/product_details_repo.dart';

class AddToCart {
  final ProductDetailsRepo _repo;

  AddToCart(this._repo);

  ResultFuture<void> execute() async {
    return await _repo.addToCart();
  }
}
