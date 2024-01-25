import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../res/app_colors.dart';
import '../../routes/app_route_constants.dart';
import 'custom_badge_icon_btn.dart';

class CustomTopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String routeName;

  const CustomTopAppBar({super.key, required this.routeName});

  @override
  State<CustomTopAppBar> createState() => _CustomTopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _CustomTopAppBarState extends State<CustomTopAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white2,
      leadingWidth: _leadingWidth(widget.routeName),
      leading: _leading(widget.routeName),
      actions: [
        if (widget.routeName != AppPage.home.toName)
          CustomBadgeIconBtn(
            onTap: _moveToSearchPage,
            amount: null,
            fluentIcon: FluentIcons.search_24_regular,
          ),
        CustomBadgeIconBtn(
          onTap: _moveToCartPage,
          amount: 99,
          flutterIcon: Icons.shopping_cart_outlined,
        ),
        if (widget.routeName != AppPage.productDetails.toName)
          CustomBadgeIconBtn(
            onTap: _moveToChatPage,
            amount: 100,
            fluentIcon: FluentIcons.chat_24_regular,
          ),
        const SizedBox(width: 8),
      ],
    );
  }

  double? _leadingWidth(String routeName) {
    return routeName == AppPage.home.toName ? 250 : null;
  }

  Widget? _leading(String routeName) {
    return widget.routeName == AppPage.home.toName
        ? GestureDetector(
            onTap: _moveToSearchPage,
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.white1,
              ),
              child: const Row(
                children: [
                  Icon(FluentIcons.search_24_regular),
                  SizedBox(width: 8),
                  Text(
                    "Bạn đang tìm gì thế?",
                    style: TextStyle(color: AppColors.pink),
                  ),
                ],
              ),
            ),
          )
        : null;
  }

  void _moveToSearchPage() => context.pushNamed(AppPage.search.name);

  void _moveToCartPage() => context.pushNamed(AppPage.cart.name);

  void _moveToChatPage() => context.pushNamed(AppPage.chat.name);
}
