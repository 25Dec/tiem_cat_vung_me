import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../domain/usecases/get_all_best_selling_products.dart';
import '../../domain/usecases/get_all_new_products.dart';
import '../../domain/usecases/get_all_products_sorted_by_price.dart';
import '../../domain/usecases/get_products_by_filter.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllNewProducts _getAllNewProducts;
  final GetAllBestSellingProducts _getAllBestSellingProducts;
  final GetAllProductsSortedByPrice _getAllProductsSortedByPrice;
  final GetProductsByFilter _getProductsByFilter;

  HomeBloc({
    required GetAllNewProducts getAllNewProducts,
    required GetAllBestSellingProducts getAllBestSellingProducts,
    required GetAllProductsSortedByPrice getAllProductsSortedByPrice,
    required GetProductsByFilter getProductsByFilter,
  })  : _getAllNewProducts = getAllNewProducts,
        _getAllBestSellingProducts = getAllBestSellingProducts,
        _getAllProductsSortedByPrice = getAllProductsSortedByPrice,
        _getProductsByFilter = getProductsByFilter,
        super(HomeInitial()) {
    on<GetAllNewProductsEvent>(_onGetAllNewProductsEvent);
    on<GetAllBestSellingProductsEvent>(_onGetAllBestSellingProductsEvent);
    on<GetAllProductsSortedByPriceEvent>(_onGetAllProductsSortedByPriceEvent);
    on<GetProductsByFilterEvent>(_onGetProductsByFilterEvent);
  }

  void _onGetAllNewProductsEvent(
    GetAllNewProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    final response = await _getAllNewProducts.execute();

    response.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(DoneGetProductsState(products: products)),
    );
  }

  void _onGetAllBestSellingProductsEvent(
    GetAllBestSellingProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    final response = await _getAllBestSellingProducts.execute();

    response.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(DoneGetProductsState(products: products)),
    );
  }

  void _onGetAllProductsSortedByPriceEvent(
    GetAllProductsSortedByPriceEvent event,
    Emitter<HomeState> emit,
  ) async {
    final response =
        await _getAllProductsSortedByPrice.execute(isPriceAsc: event.isPriceAsc);

    response.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(DoneGetProductsState(products: products)),
    );
  }

  void _onGetProductsByFilterEvent(
    GetProductsByFilterEvent event,
    Emitter<HomeState> emit,
  ) async {
    final response = await _getProductsByFilter.execute(options: event.options);

    response.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(DoneGetProductsState(products: products)),
    );
  }
}
