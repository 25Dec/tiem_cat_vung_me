import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiem_cat_vung_me/features/home/domain/usecases/get_all_products.dart';

import '../../../../core/common/entites/product_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllProducts _getAllProducts;

  HomeBloc({required GetAllProducts getAllProducts})
      : _getAllProducts = getAllProducts,
        super(HomeInitial()) {
    on<GetAllProductsEvent>(_onGetAllProductsEvent);
  }

  void _onGetAllProductsEvent(GetAllProductsEvent event, Emitter<HomeState> emit) async {
    emit(GettingAllProductsState());

    final response = await _getAllProducts.execute();

    response.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (products) => emit(DoneGetAllProductsState(products: products)),
    );
  }
}
