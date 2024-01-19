import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../res/app_colors.dart';
import '../../routes/app_route_constants.dart';
import 'custom_badge_icon_btn.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String routeName;

  const CustomAppBar({super.key, required this.routeName});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void moveToSearchPage() => GoRouter.of(context).pushNamed(AppPage.search.name);

  void moveToCartPage() => GoRouter.of(context).pushNamed(AppPage.cart.name);

  void moveToChatPage() => GoRouter.of(context).pushNamed(AppPage.chat.name);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white2,
      leadingWidth: widget.routeName == AppPage.home.toName ? 260 : null,
      centerTitle: true,
      leading: widget.routeName == AppPage.home.toName
          ? GestureDetector(
              onTap: moveToSearchPage,
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
          : null,
      actions: [
        CustomBadgeIconBtn(
          onTap: moveToCartPage,
          amount: 99,
          icon: FluentIcons.cart_24_regular,
        ),
        const SizedBox(width: 8),
        CustomBadgeIconBtn(
          onTap: moveToChatPage,
          amount: 100,
          icon: FluentIcons.chat_24_regular,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
