import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/product_details_repo.dart';
import '../datasources/product_details_remote_data_source.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteDataSource _remoteDataSource;

  ProductDetailsRepoImpl(this._remoteDataSource);

  @override
  ResultFuture<void> addToCart({required String productId}) async {
    try {
      await _remoteDataSource.addToCart(productId: productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> addToFavorites({required String productId}) async {
    try {
      await _remoteDataSource.addToFavorites(productId: productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<ProductEntity> getProductDetails({required String id}) async {
    try {
      final response = await _remoteDataSource.getProductDetails(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
