import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/models/product_model.dart';
import '../../../../core/errors/exception.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  HomeRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> result = [];
    try {
      final collectionRef = _firebaseFirestore.collection("products");
      QuerySnapshot querySnapshot = await collectionRef.get();

      for (DocumentSnapshot document in querySnapshot.docs) {
        final data = document.data();
        result.add(ProductModel.fromJson(data as Map<String, dynamic>));
      }
      return result;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
