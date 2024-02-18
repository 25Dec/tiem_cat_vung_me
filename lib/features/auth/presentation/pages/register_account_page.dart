import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/auth_bloc.dart';

class RegisterAccountPage extends StatefulWidget {
  final String phoneNumber;

  const RegisterAccountPage({super.key, required this.phoneNumber});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    bool isEmailValid = CoreUtils.validateEmail(value!);
    return isEmailValid ? null : "Email không hợp lệ";
  }

  String? passwordValidator(String? value) {
    bool isPasswordValid = CoreUtils.validatePassword(value!);
    return isPasswordValid ? null : "Mật khẩu không hợp lệ";
  }

  String? confirmPasswordValidator(String? value) {
    return confirmPasswordController.text == passwordController.text
        ? null
        : "Mật khẩu không khớp";
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Tạo tài khoản")),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 4,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Họ và tên',
                  prefixIcon: FluentIcons.person_circle_24_regular,
                  controller: fullNameController,
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Email',
                  prefixIcon: FluentIcons.mail_24_regular,
                  controller: emailController,
                  validator: emailValidator,
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Mật khẩu',
                  prefixIcon: FluentIcons.lock_closed_24_regular,
                  controller: passwordController,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'Xác nhận mật khẩu',
                  prefixIcon: FluentIcons.lock_closed_24_regular,
                  controller: confirmPasswordController,
                  validator: confirmPasswordValidator,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => authBloc.add(
                      RegisterAccountEvent(
                        fullName: fullNameController.text.trim(),
                        email: emailController.text.trim(),
                        phoneNumber: widget.phoneNumber,
                        password: passwordController.text.trim(),
                      ),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(AppColors.pink),
                      foregroundColor: MaterialStateProperty.all(AppColors.white2),
                    ),
                    child: const Text("Tạo tài khoản"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
