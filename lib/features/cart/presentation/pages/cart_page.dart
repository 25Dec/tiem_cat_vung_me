import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/common/widgets/slidable_product_card.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../widgets/custom_cart_bottom_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductEntity> cart = [
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO98",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO98",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO99",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO95",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO94",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO93",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO92",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProductEntity(
      productId: "7V3aCsqk6Qi3zrHwbO91",
      productName: "Hạt Cho Mèo Mọi Lứa Tuổi Cats On",
      prices: {"1kg": 80000, "5kg": 390000},
      brand: "Cat's On",
      productCategory: "Foods",
      imagesUrl: [
        "https://firebasestorage.googleapis.com/v0/b/tiem-cat-vung-me-60dd4.appspot.com/o/Foods%2Fhat-cat-on%2Fhat-cats-on.png?alt=media&token=b900b0c4-50e8-43a6-af72-51704456e784"
      ],
      quantityInStock: 100,
      soldQuantity: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetAllNewProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is DoneGetProductsState) {
          final cart = state.products;

          return Scaffold(
            appBar: CustomTopAppBar(
              routeName: AppPage.cart.toName,
            ),
            body: ListView.builder(
              itemCount: cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SlidableProductCard(product: cart[index]);
              },
            ),
            bottomNavigationBar: CustomCartBottomAppBar(
              context: context,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
