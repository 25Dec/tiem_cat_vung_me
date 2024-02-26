// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/models/product_model.dart';
import '../../../../core/errors/exception.dart';

enum FilterType { newProducts, bestSellingProducts, priceDesc, priceAsc, custom }

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getAllNewProducts();
  Future<List<ProductModel>> getAllBestSellingProducts();
  Future<List<ProductModel>> getAllProductsSortedByPrice({
    required bool isPriceAsc,
  });
  Future<List<ProductModel>> getProductsByFilter({
    required List<String> options,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  HomeRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<List<ProductModel>> getAllNewProducts() async {
    return await _getProducts(
      FilterType.newProducts,
    );
  }

  @override
  Future<List<ProductModel>> getAllBestSellingProducts() async {
    return await _getProducts(
      FilterType.bestSellingProducts,
    );
  }

  @override
  Future<List<ProductModel>> getAllProductsSortedByPrice({
    required bool isPriceAsc,
  }) async {
    return isPriceAsc
        ? await _getProducts(FilterType.priceAsc)
        : await _getProducts(FilterType.priceDesc);
  }

  @override
  Future<List<ProductModel>> getProductsByFilter({
    required List<String> options,
  }) async {
    return await _getProducts(
      FilterType.custom,
      options,
    );
  }

  Future<List<ProductModel>> _getProducts(
    FilterType type, [
    List<String> options = const [],
  ]) async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFirestore.collection("products").get();

      switch (type) {
        case FilterType.newProducts:
          return _transferQuerySnapshotToList(querySnapshot);

        case FilterType.bestSellingProducts:
          return _sortBySoldQuantity(querySnapshot);

        case FilterType.priceAsc:
          return _sortByPrice(querySnapshot, FilterType.priceAsc);

        case FilterType.priceDesc:
          return _sortByPrice(querySnapshot, FilterType.priceDesc);

        default:
          return _transferQuerySnapshotToList(querySnapshot);
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  List<ProductModel> _sortBySoldQuantity(QuerySnapshot querySnapshot) {
    List<ProductModel> result = _transferQuerySnapshotToList(querySnapshot);

    result.sort((currProduct, otherProduct) {
      return currProduct.soldQuantity.compareTo(otherProduct.soldQuantity);
    });

    return result.reversed.toList();
  }

  List<ProductModel> _sortByPrice(
    QuerySnapshot querySnapshot,
    FilterType type,
  ) {
    List<ProductModel> result = _transferQuerySnapshotToList(querySnapshot);

    result.sort((currProduct, otherProduct) {
      return currProduct.prices.entries.first.value
          .compareTo(otherProduct.prices.entries.first.value);
    });

    return type == FilterType.priceAsc ? result : result.reversed.toList();
  }

  List<ProductModel> _transferQuerySnapshotToList(
    QuerySnapshot querySnapshot,
  ) {
    List<ProductModel> result = [];

    for (DocumentSnapshot document in querySnapshot.docs) {
      final data = document.data();
      result.add(ProductModel.fromJson(data as Map<String, dynamic>));
    }

    return result;
  }
}
