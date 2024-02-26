import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/routes/app_route_constants.dart';
import 'package:tiem_cat_vung_me/features/auth/domain/entities/user_entity.dart';
import 'package:tiem_cat_vung_me/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/common/entites/product_entity.dart';
import '../../../../core/res/app_colors.dart';

class CustomProductDetailsBottomAppBar extends StatelessWidget {
  final BuildContext context;
  final ProductEntity product;

  const CustomProductDetailsBottomAppBar({
    super.key,
    required this.context,
    required this.product,
  });

  void chatWithSeller(UserEntity? userData) {
    if (userData != null) {
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  void addToCart(UserEntity? userData) {
    if (userData != null) {
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  void buyNow(UserEntity? userData) {
    if (userData != null) {
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      padding: EdgeInsets.zero,
      color: AppColors.white2,
      surfaceTintColor: AppColors.white2,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          UserEntity? userData;

          if (state is HasUserDataState) {
            userData = state.user;
          }

          return Row(
            children: [
              InkWell(
                onTap: () => chatWithSeller(userData),
                child: Ink(
                  child: const SizedBox(
                    width: 90,
                    height: double.infinity,
                    child: Icon(
                      FluentIcons.chat_24_regular,
                      color: AppColors.pink,
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 0,
                indent: 15,
                endIndent: 15,
                color: AppColors.white3,
              ),
              InkWell(
                onTap: () => addToCart(userData),
                child: Ink(
                  child: SizedBox(
                    width: 90,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        String.fromCharCode(Icons.add_shopping_cart_outlined.codePoint),
                        style: TextStyle(
                          color: AppColors.pink,
                          fontSize: 24,
                          fontWeight: FontWeight.w100,
                          fontFamily: Icons.add_shopping_cart_outlined.fontFamily,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: AppColors.pink,
                  child: InkWell(
                    onTap: () => buyNow(userData),
                    child: Ink(
                      child: const Text(
                        "Mua ngay",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
