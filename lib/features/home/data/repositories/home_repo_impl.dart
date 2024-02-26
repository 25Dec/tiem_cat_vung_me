import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);

  @override
  ResultFuture<List<ProductEntity>> getAllNewProducts() async {
    try {
      final response = await _remoteDataSource.getAllNewProducts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getAllBestSellingProducts() async {
    try {
      final response = await _remoteDataSource.getAllBestSellingProducts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getAllProductsSortedByPrice({
    required bool isPriceAsc,
  }) async {
    try {
      final response =
          await _remoteDataSource.getAllProductsSortedByPrice(isPriceAsc: isPriceAsc);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getProductsByFilter({
    required List<String> options,
  }) async {
    try {
      final response = await _remoteDataSource.getProductsByFilter(options: options);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
