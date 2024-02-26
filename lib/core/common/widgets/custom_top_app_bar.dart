import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/domain/entities/user_entity.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../features/favorites/presentation/bloc/favorites_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(GetUserDataEvent());
  }

  double? leadingWidth(String routeName) {
    return routeName == AppPage.home.toName ? 250 : null;
  }

  Widget? leading(String routeName) {
    return routeName == AppPage.home.toName
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
        : null;
  }

  Widget? title(
    String routeName, [
    int numberOfFavoriteProducts = 0,
    int numberOfProductsInCart = 0,
  ]) {
    const TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    if (routeName == AppPage.favorites.toName) {
      return Text(
        "Lượt thích ($numberOfFavoriteProducts)",
        style: textStyle,
      );
    } else if (routeName == AppPage.cart.toName) {
      return Text(
        "Giỏ hàng ($numberOfProductsInCart)",
        style: textStyle,
      );
    } else if (routeName == AppPage.addresses.toName) {
      return const Text(
        "Sổ địa chỉ",
        style: textStyle,
      );
    } else if (routeName == AppPage.addNewAddress.toName) {
      return const Text(
        "Thêm địa chỉ mới",
        style: textStyle,
      );
    } else if (routeName == AppPage.editAddress.toName) {
      return const Text(
        "Chỉnh sửa địa chỉ",
        style: textStyle,
      );
    }
    return Container();
  }

  void moveToSearchPage() => GoRouter.of(context).pushNamed(AppPage.search.name);

  void moveToCartPage(UserEntity? userData) {
    if (userData != null) {
      GoRouter.of(context).pushNamed(AppPage.cart.name);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  void moveToChatPage(UserEntity? userData) {
    if (userData != null) {
      GoRouter.of(context).pushNamed(AppPage.chat.name);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, favoritesState) {
          int numberOfFavoriteProducts = 0;

          if (favoritesState is DoneGetFavoritesListState) {
            numberOfFavoriteProducts = favoritesState.favorites.length;
          }

          return title(widget.routeName, numberOfFavoriteProducts)!;
        },
      ),
      backgroundColor: AppColors.white2,
      leadingWidth: leadingWidth(widget.routeName),
      leading: leading(widget.routeName),
      actions: [
        if (widget.routeName != AppPage.home.toName &&
            widget.routeName != AppPage.profile.toName &&
            widget.routeName != AppPage.cart.toName &&
            widget.routeName != AppPage.addresses.toName &&
            widget.routeName != AppPage.addNewAddress.toName &&
            widget.routeName != AppPage.editAddress.toName &&
            widget.routeName != AppPage.favorites.toName)
          CustomBadgeIconBtn(
            onTap: moveToSearchPage,
            fluentIcon: FluentIcons.search_24_regular,
          ),
        if (widget.routeName != AppPage.cart.toName &&
            widget.routeName != AppPage.addresses.toName &&
            widget.routeName != AppPage.addNewAddress.toName &&
            widget.routeName != AppPage.editAddress.toName)
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              UserEntity? userData;

              if (state is HasUserDataState) {
                userData = state.user;
              }

              return CustomBadgeIconBtn(
                onTap: () => moveToCartPage(userData),
                amount: userData?.cart?.length,
                flutterIcon: Icons.shopping_cart_outlined,
              );
            },
          ),
        if (widget.routeName != AppPage.productDetails.toName &&
            widget.routeName != AppPage.addresses.toName &&
            widget.routeName != AppPage.addNewAddress.toName &&
            widget.routeName != AppPage.editAddress.toName)
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              UserEntity? userData;

              if (state is HasUserDataState) {
                userData = state.user;
              }

              return CustomBadgeIconBtn(
                onTap: () => moveToChatPage(userData),
                fluentIcon: FluentIcons.chat_24_regular,
              );
            },
          ),
        const SizedBox(width: 8),
      ],
    );
  }
}
