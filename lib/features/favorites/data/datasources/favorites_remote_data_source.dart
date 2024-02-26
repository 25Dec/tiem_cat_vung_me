import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/common/models/product_model.dart';
import '../../../../core/errors/exception.dart';
import '../../../auth/data/models/user_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<ProductModel>> getFavoritesList();
  Future<void> toggleFavoritesList({required String productId});
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  FavoritesRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<List<ProductModel>> getFavoritesList() async {
    List<ProductModel> result = [];
    try {
      final uid = _firebaseAuth.currentUser?.uid;

      if (uid != null) {
        final response = await _firebaseFirestore.collection("users").doc(uid).get();

        final data = UserModel.fromJson(response.data()!);

        print("Favorites: $data");
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
    return result;
  }

  @override
  Future<void> toggleFavoritesList({required String productId}) async {
    try {} on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
