import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/favorites_repo.dart';
import '../datasources/favorites_remote_data_source.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteDataSource _remoteDataSource;

  FavoritesRepoImpl(this._remoteDataSource);

  @override
  ResultFuture<List<ProductEntity>> getFavoritesList() async {
    try {
      final response = await _remoteDataSource.getFavoritesList();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> toggleFavoritesList({required String productId}) async {
    try {
      await _remoteDataSource.toggleFavoritesList(productId: productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
