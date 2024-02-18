import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tiem_cat_vung_me/core/common/widgets/custom_badge_icon_btn.dart';
import 'package:tiem_cat_vung_me/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/common/widgets/custom_clickable_row.dart';
import '../../../../core/common/widgets/custom_text_button.dart';
import '../../../../core/common/widgets/custom_top_app_bar.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = AppPage.profile.toName;

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void moveToAccountAndSecurityPage() =>
      context.pushNamed(AppPage.accountAndSecurity.toName);

  void moveToAddressesPage() => context.pushNamed(AppPage.addresses.toName);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: CustomTopAppBar(routeName: ProfilePage.routeName),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                child: SvgPicture.asset(
                  "assets/images/default_avatar.svg",
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Nguyen Huynh Thien Nhan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              CustomClickableRow(
                onTap: () {},
                widgets: const [
                  Text("Đơn hàng của tôi"),
                  Text(
                    "Xem lịch sử mua hàng",
                    style: TextStyle(fontSize: 12, color: AppColors.white4),
                  ),
                ],
              ),
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
                          const Text("Chờ lấy hàng"),
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
              const Divider(
                color: AppColors.white5,
              ),
              CustomClickableRow(
                onTap: moveToAccountAndSecurityPage,
                displayRightChervron: true,
                widgets: const [
                  Text("Tài khoản & Bảo mật"),
                ],
              ),
              CustomClickableRow(
                onTap: moveToAddressesPage,
                displayRightChervron: true,
                widgets: const [
                  Text("Sổ địa chỉ"),
                ],
              ),
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
