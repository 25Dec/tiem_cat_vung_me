import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/add_to_favorites.dart';
import '../../domain/usecases/get_product_details.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetails _getProductDetails;
  final AddToCart _addToCart;
  final AddToFavorites _addToFavorites;

  ProductDetailsBloc({
    required GetProductDetails getProductDetails,
    required AddToCart addToCart,
    required AddToFavorites addToFavorites,
  })  : _getProductDetails = getProductDetails,
        _addToCart = addToCart,
        _addToFavorites = addToFavorites,
        super(ProductDetailsInitial()) {
    on<GetProductDetailsEvent>(_onGetProductDetailsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<AddToFavoritesEvent>(_onAddToFavoritesEvent);
  }

  void _onGetProductDetailsEvent(
      GetProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    emit(GettingProductDetailsState());

    final response = await _getProductDetails.execute(id: event.id);

    response.fold(
      (failure) => emit(ProductDetailsError(message: failure.message)),
      (product) => emit(DoneGetProductDetailsState(product)),
    );
  }

  void _onAddToCartEvent(
    AddToCartEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final response = await _addToCart.execute(
      productId: event.productId,
    );

    response.fold(
      (failure) => emit(ProductDetailsError(message: failure.message)),
      (_) => emit(AddedToCartState()),
    );
  }

  void _onAddToFavoritesEvent(
    AddToFavoritesEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final response = await _addToFavorites.execute(
      productId: event.productId,
    );

    response.fold(
      (failure) => emit(ProductDetailsError(message: failure.message)),
      (_) => emit(AddedToFavoritesState()),
    );
  }
}
