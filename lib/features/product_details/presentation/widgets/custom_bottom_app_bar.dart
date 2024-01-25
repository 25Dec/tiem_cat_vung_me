import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/res/app_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  final BuildContext context;
  final ProductEntity product;

  const CustomBottomAppBar({
    super.key,
    required this.context,
    required this.product,
  });

  void chatWithSeller() {}

  void addToCart() {}

  void buyNow() {}

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 65,
      color: AppColors.white2,
      surfaceTintColor: AppColors.white2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: chatWithSeller,
            child: Ink(
              child: const Icon(
                FluentIcons.chat_24_regular,
                color: AppColors.pink,
              ),
            ),
          ),
          InkWell(
            onTap: addToCart,
            child: Ink(
              child: Text(
                String.fromCharCode(Icons.add_shopping_cart_outlined.codePoint),
                style: TextStyle(
                  color: AppColors.pink,
                  inherit: false,
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                  fontFamily: Icons.add_shopping_cart_outlined.fontFamily,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: buyNow,
            child: Ink(
              child: Container(
                decoration: const BoxDecoration(color: AppColors.pink),
                child: const Text("Mua ngay"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
