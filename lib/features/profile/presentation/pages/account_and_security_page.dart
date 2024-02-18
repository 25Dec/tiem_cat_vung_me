import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_clickable_row.dart';

class AccountAndSecurityPage extends StatefulWidget {
  const AccountAndSecurityPage({super.key});

  @override
  State<AccountAndSecurityPage> createState() => _AccountAndSecurityPageState();
}

class _AccountAndSecurityPageState extends State<AccountAndSecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tài khoản & Bảo mật")),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Tên"),
            ],
          ),
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Giới tính"),
            ],
          ),
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Ngày sinh"),
            ],
          ),
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Thay đổi mẩu khẩu"),
            ],
          ),
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Thay đổi số điện thoại"),
            ],
          ),
          CustomClickableRow(
            onTap: () {},
            displayRightChervron: true,
            widgets: const [
              Text("Thay đổi email"),
            ],
          ),
        ],
      ),
    );
  }
}
