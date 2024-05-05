// ignore_for_file: avoid_function_literals_in_foreach_calls

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

  FavoritesRemoteDataSourceImpl(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  @override
  Future<List<ProductModel>> getFavoritesList() async {
    List<ProductModel> result = [];
    try {
      final uid = _firebaseAuth.currentUser?.uid;
      final listOfProducts = await _transferQuerySnapshotToList();
      List<String> idOfFavoriteProducts = [];

      if (uid != null) {
        final response = await _firebaseFirestore.collection("users").doc(uid).get();
        idOfFavoriteProducts = UserModel.fromJson(response.data()!).favorites!;
      }

      if (idOfFavoriteProducts.isNotEmpty) {
        idOfFavoriteProducts.forEach((id) {
          listOfProducts.forEach((product) {
            if (id == product.productId) {
              result.add(product);
            }
          });
        });
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
    return result;
  }

  @override
  Future<void> toggleFavoritesList({required String productId}) async {
    try {
      final uid = _firebaseAuth.currentUser?.uid;
      final response = await _firebaseFirestore.collection("users").doc(uid).get();
      List<String> idOfFavoriteProducts = UserModel.fromJson(response.data()!).favorites!;

      if (!idOfFavoriteProducts.contains(productId)) {
        idOfFavoriteProducts.add(productId);
      } else {
        idOfFavoriteProducts.remove(productId);
      }

      if (uid != null) {
        await _firebaseFirestore.collection("users").doc(uid).set(
          {"favorites": idOfFavoriteProducts},
          SetOptions(merge: true),
        );
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  Future<List<ProductModel>> _transferQuerySnapshotToList() async {
    List<ProductModel> result = [];
    QuerySnapshot querySnapshot = await _firebaseFirestore.collection("products").get();

    for (DocumentSnapshot document in querySnapshot.docs) {
      final data = document.data();
      result.add(
        ProductModel.fromJson(data as Map<String, dynamic>),
      );
    }

    return result;
  }
}
