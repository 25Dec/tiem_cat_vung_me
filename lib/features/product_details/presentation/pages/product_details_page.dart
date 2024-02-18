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
import '../bloc/product_details_bloc.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../widgets/custom_expansion_tile.dart';

class ProductDetailsPage extends StatefulWidget {
  static String routeName = AppPage.productDetails.toName;
  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

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
  }

  void toggleFavoriteProduct(UserEntity? userData) {
    if (userData != null) {
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(routeName: ProductDetailsPage.routeName),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, productDetailsState) {
              UserEntity? userData;
              ProductEntity? product;

              if (authState is HasUserDataState) {
                userData = authState.user;
              }

              if (productDetailsState is DoneGetProductDetailsState) {
                product = productDetailsState.product;
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          CoreUtils.currencyConverter(product.prices.values.first),
                          style: const TextStyle(
                            color: AppColors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Đã bán ${product.soldQuantity}"),
                            GestureDetector(
                              onTap: () => toggleFavoriteProduct(userData),
                              child: const Icon(FluentIcons.heart_24_regular),
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
              return const Center(child: CircularProgressIndicator.adaptive());
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is DoneGetProductDetailsState) {
            final product = state.product;
            return CustomBottomAppBar(context: context, product: product);
          }
          return Container();
        },
      ),
    );
  }
}
