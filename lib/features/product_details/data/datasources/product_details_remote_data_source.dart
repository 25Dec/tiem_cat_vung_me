import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/models/product_model.dart';
import '../../../../core/errors/exception.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductModel> getProductDetails({required String id});
  Future<void> addToCart({required String productId});
  Future<void> addToFavorites({required String productId});
}

class ProductDetailsRemoteDataSourceImpl implements ProductDetailsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ProductDetailsRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<void> addToCart({required String productId}) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<void> addToFavorites({required String productId}) {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProductDetails({required String id}) async {
    try {
      final response = await _firebaseFirestore.collection("products").doc(id).get();
      return ProductModel.fromJson(response.data()!);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
