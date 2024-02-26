import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_clickable_row.dart';
import '../../../../core/utils/core_utils.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomTextFieldBottomSheet(
                context,
                bottomSheetTitle: "Tên",
                hasTextField: true,
                textFieldLabel: "Họ Tên",
              ),
              displayRightChervron: true,
              widgets: const [
                Text("Tên"),
              ],
            ),
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomTextFieldBottomSheet(
                context,
                bottomSheetTitle: "Giới tính",
              ),
              displayRightChervron: true,
              widgets: const [
                Text("Giới tính"),
              ],
            ),
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomDatePicker(context),
              widgets: const [
                Text("Ngày sinh"),
              ],
            ),
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomTextFieldBottomSheet(
                context,
                bottomSheetTitle: "Mật khẩu",
                hasTextField: true,
                textFieldLabel: "Mật khẩu mới",
              ),
              displayRightChervron: true,
              widgets: const [
                Text("Thay đổi mẩu khẩu"),
              ],
            ),
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomTextFieldBottomSheet(
                context,
                bottomSheetTitle: "Số điện thoại",
                hasTextField: true,
                textFieldLabel: "Số điện thoại mới",
              ),
              displayRightChervron: true,
              widgets: const [
                Text("Thay đổi số điện thoại"),
              ],
            ),
            CustomClickableRow(
              onTap: () => CoreUtils.showCustomTextFieldBottomSheet(
                context,
                bottomSheetTitle: "Email",
                hasTextField: true,
                textFieldLabel: "Email mới",
              ),
              displayRightChervron: true,
              widgets: const [
                Text("Thay đổi email"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
