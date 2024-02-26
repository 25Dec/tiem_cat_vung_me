import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_badge_icon_btn.dart';
import '../../../../core/common/widgets/custom_clickable_row.dart';
import '../../../../core/common/widgets/custom_text_button.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void moveToSignInPage() => GoRouter.of(context).pushNamed(
        AppPage.auth.toName,
      );

  void moveToSignUpPage() => GoRouter.of(context).pushNamed(
        AppPage.auth.toName,
        extra: {"isSignUpPage": true},
      );

  void moveToAccountAndSecurityPage(UserEntity? user) {
    if (user != null) {
      GoRouter.of(context).pushNamed(AppPage.accountAndSecurity.toName);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  void moveToAddressesPage(UserEntity? user) {
    if (user != null) {
      GoRouter.of(context).pushNamed(AppPage.addresses.toName);
    } else {
      GoRouter.of(context).pushNamed(AppPage.auth.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: CustomTopAppBar(routeName: AppPage.profile.toName),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          UserEntity? user;
          String? fullName;

          if (authState is HasUserDataState) {
            user = authState.user;
            fullName = user.fullName;
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                child: SvgPicture.asset(
                  user != null
                      ? "assets/images/default_avatar.svg"
                      : "assets/images/not_sign_in_avatar.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
              const SizedBox(height: 16),
              if (user != null)
                Container(
                  width: MediaQuery.of(context).size.width - 16,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    fullName!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: moveToSignInPage,
                      child: const Text("Đăng nhập"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: moveToSignUpPage,
                      child: const Text("Đăng ký"),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              CustomClickableRow(
                onTap: () {},
                displayRightChervron: true,
                widgets: const [
                  Text("Đơn mua"),
                ],
              ),
              if (user != null)
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            CustomBadgeIconBtn(
                              onTap: () {},
                              amount: 0,
                              fluentIcon: FluentIcons.wallet_24_regular,
                            ),
                            const Text("Chờ xác nhận"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            CustomBadgeIconBtn(
                              onTap: () {},
                              amount: 0,
                              fluentIcon: FluentIcons.box_24_regular,
                            ),
                            const Text("Chờ đóng gói"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Column(
                          children: [
                            CustomBadgeIconBtn(
                              onTap: () {},
                              amount: null,
                              fluentIcon: FluentIcons.vehicle_truck_bag_24_regular,
                            ),
                            const Text("Chờ giao hàng"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (user != null)
                const Divider(
                  color: AppColors.white5,
                ),
              CustomClickableRow(
                onTap: () => moveToAccountAndSecurityPage(user),
                displayRightChervron: true,
                widgets: const [
                  Text("Tài khoản & Bảo mật"),
                ],
              ),
              CustomClickableRow(
                onTap: () => moveToAddressesPage(user),
                displayRightChervron: true,
                widgets: const [
                  Text("Sổ địa chỉ"),
                ],
              ),
              if (user != null)
                CustomTextButton(
                  onPressed: () => authBloc.add(SignOutEvent()),
                  text: "Đăng xuất",
                  textColor: AppColors.pink,
                )
            ],
          );
        },
      ),
    );
  }
}
