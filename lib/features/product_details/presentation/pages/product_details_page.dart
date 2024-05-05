import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/common/widgets/custom_carousel_slider.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../favorites/presentation/bloc/favorites_bloc.dart';
import '../bloc/product_details_bloc.dart';
import '../widgets/custom_expansion_tile.dart';
import '../widgets/custom_product_details_bottom_app_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;

  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductDetailsBloc>(context).add(
      GetProductDetailsEvent(id: widget.productId),
    );
    BlocProvider.of<FavoritesBloc>(context).add(
      GetFavoritesListEvent(),
    );
  }

  void toggleFavoriteProduct(
    UserEntity? userData, {
    required String productId,
  }) {
    if (userData != null) {
      BlocProvider.of<FavoritesBloc>(context).add(
        ToggleFavoritesListEvent(productId: productId),
      );
      BlocProvider.of<FavoritesBloc>(context).add(
        GetFavoritesListEvent(),
      );
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: AppPage.productDetails.toName),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, favoritesState) {
              return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, productDetailsState) {
                  UserEntity? userData;
                  ProductEntity? product;
                  bool isFavorite = false;

                  if (authState is HasUserDataState) {
                    userData = authState.user;
                  }

                  if (productDetailsState is DoneGetProductDetailsState) {
                    product = productDetailsState.product;

                    if (favoritesState is DoneGetFavoritesListState) {
                      isFavorite = favoritesState.favorites.contains(product);
                    }

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCarouselSlider(
                            height: 250,
                            autoPlay: false,
                            isHomePage: false,
                            items: product.imagesUrl,
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(product.productName),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Text(
                              CoreUtils.currencyConverter(
                                product.prices.values.first,
                              ),
                              style: const TextStyle(
                                color: AppColors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Đã bán ${product.soldQuantity}"),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                    toggleFavoriteProduct(
                                      userData,
                                      productId: widget.productId,
                                    );
                                  },
                                  child: isFavorite
                                      ? const Icon(
                                          FluentIcons.heart_16_filled,
                                          color: AppColors.pink,
                                        )
                                      : const Icon(
                                          FluentIcons.heart_16_regular,
                                        ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomExpansionTile(product: product),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is DoneGetProductDetailsState) {
            final product = state.product;
            return CustomProductDetailsBottomAppBar(
              context: context,
              product: product,
            );
          }
          return Container();
        },
      ),
    );
  }
}
