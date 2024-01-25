import '../../../../core/utils/typedefs.dart';
import '../repositories/product_details_repo.dart';

class AddToFavorites {
  final ProductDetailsRepo _repo;

  AddToFavorites(this._repo);

  ResultFuture<void> execute() async {
    return await _repo.addToFavorites();
  }
}
