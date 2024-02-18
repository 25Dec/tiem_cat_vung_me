import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/domain/entities/user_entity.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../res/app_colors.dart';
import '../../routes/app_route_constants.dart';
import 'custom_badge_icon_btn.dart';

class CustomTopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String routeName;

  const CustomTopAppBar({
    super.key,
    required this.routeName,
  });

  @override
  State<CustomTopAppBar> createState() => _CustomTopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomTopAppBarState extends State<CustomTopAppBar> {
  double? _leadingWidth(String routeName) {
    return routeName == AppPage.home.toName ? 250 : null;
  }

  Widget? _leading(String routeName) {
    return routeName == AppPage.home.toName
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

  void _moveToCartPage(UserEntity? userData) {
    if (userData != null) {
      GoRouter.of(context).pushNamed(AppPage.cart.name);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  void _moveToChatPage(UserEntity? userData) {
    if (userData != null) {
      GoRouter.of(context).pushNamed(AppPage.chat.name);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white2,
      leadingWidth: _leadingWidth(widget.routeName),
      leading: _leading(widget.routeName),
      actions: [
        if (widget.routeName != AppPage.home.toName &&
            widget.routeName != AppPage.profile.toName)
          CustomBadgeIconBtn(
            onTap: _moveToSearchPage,
            fluentIcon: FluentIcons.search_24_regular,
          ),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            UserEntity? userData;

            if (state is HasUserDataState) {
              userData = state.user;
            }

            return CustomBadgeIconBtn(
              onTap: () => _moveToCartPage(userData),
              amount: userData?.cart?.length,
              flutterIcon: Icons.shopping_cart_outlined,
            );
          },
        ),
        if (widget.routeName != AppPage.productDetails.toName)
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              UserEntity? userData;

              if (state is HasUserDataState) {
                userData = state.user;
              }

              return CustomBadgeIconBtn(
                onTap: () => _moveToChatPage(userData),
                fluentIcon: FluentIcons.chat_24_regular,
              );
            },
          ),
        const SizedBox(width: 8),
      ],
    );
  }
}
