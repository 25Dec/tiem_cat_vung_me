import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({super.key});

  @override
  State<RegisterAccountPage> createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tạo tài khoản")),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
          child: Column(
            children: [
              TextFormField(
                controller: fullNameController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(FluentIcons.person_circle_24_regular),
                  hintText: 'Họ và tên',
                  hintStyle: TextStyle(color: AppColors.white3),
                ),
                validator: null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(FluentIcons.mail_24_regular),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.white3),
                ),
                validator: null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(FluentIcons.lock_closed_24_regular),
                  hintText: 'Mật khẩu',
                  hintStyle: TextStyle(color: AppColors.white3),
                ),
                validator: null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: confirmPasswordController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(FluentIcons.lock_closed_24_regular),
                  hintText: 'Xác nhận mật khẩu',
                  hintStyle: TextStyle(color: AppColors.white3),
                ),
                validator: null,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
    );
  }
}
