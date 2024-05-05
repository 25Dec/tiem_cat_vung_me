import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../../res/app_colors.dart';
import '../../routes/app_route_constants.dart';
import '../../utils/core_utils.dart';
import '../entites/product_entity.dart';

class ProductCard extends StatefulWidget {
  final ProductEntity product;
  final bool displayActionsForFavoritesPage;

  const ProductCard({
    super.key,
    required this.product,
    this.displayActionsForFavoritesPage = false,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesBloc>(context).add(
      GetFavoritesListEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String productId = widget.product.productId;
    String thumbnail = widget.product.imagesUrl[0];
    String productName = widget.product.productName;
    String price = CoreUtils.currencyConverter(widget.product.prices.values.first);
    int soldQuantity = widget.product.soldQuantity;

    void onTap() {
      GoRouter.of(context).push("${AppPage.productDetails.toPath}/$productId");
    }

    return SizedBox(
      width: 170,
      height: 270,
      child: Card(
        color: AppColors.white2,
        elevation: 0.5,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 4,
                  top: 8,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 4,
                    ),
                    child: Text(
                      price,
                      style: const TextStyle(color: AppColors.pink),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 4,
                    ),
                    child: Text("Đã bán $soldQuantity"),
                  ),
                ],
              ),
              if (widget.displayActionsForFavoritesPage)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FluentIcons.heart_24_regular,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
