import 'package:fpdart/fpdart.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  ResultFuture<List<ProductEntity>> getAllProducts() async {
    try {
      final response = await _homeRemoteDataSource.getAllProducts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
