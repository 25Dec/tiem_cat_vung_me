import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/models/product_model.dart';
import '../../../../core/errors/exception.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductModel> getProductDetails(String id);
  Future<void> addToCart();
  Future<void> addToFavorites();
}

class ProductDetailsRemoteDataSourceImpl implements ProductDetailsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  ProductDetailsRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<void> addToCart() {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<void> addToFavorites() {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProductDetails(String id) async {
    try {
      final response = await _firebaseFirestore.collection("products").doc(id).get();
      return ProductModel.fromJson(response.data()!);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
