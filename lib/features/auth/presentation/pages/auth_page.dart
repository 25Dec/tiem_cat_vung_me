import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/res/app_colors.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_text_button.dart';
import 'verify_otp_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignInPage = true;
  bool isSignInWithSMS = false;

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void moveToVerifyOtpPage() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SendOtpEvent(phoneNumber: phoneNumberController.text),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VerifyOtpPage()));
    }
  }

  String? phoneNumberValidator(String? value) {
    bool isValid = CoreUtils.validatePhoneNumber(value!);
    return isValid ? null : "Số điện thoại không chính xác";
  }

  String? passwordValidator(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isSignInPage ? "Đăng nhập" : "Đăng ký")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
          child: Column(
            children: [
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(FluentIcons.phone_24_regular),
                  hintText: 'Số điện thoại',
                  hintStyle: TextStyle(color: AppColors.white3),
                ),
                validator: phoneNumberValidator,
              ),
              const SizedBox(height: 8),
              if (isSignInPage && !isSignInWithSMS)
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FluentIcons.lock_closed_24_regular),
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(color: AppColors.white3),
                  ),
                  validator: passwordValidator,
                ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: moveToVerifyOtpPage,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(AppColors.pink),
                    foregroundColor: MaterialStateProperty.all(AppColors.white2),
                  ),
                  child: const Text("Tiếp theo"),
                ),
              ),
              if (isSignInPage)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      onPressed: () => setState(() {
                        isSignInWithSMS = !isSignInWithSMS;
                      }),
                      text: isSignInWithSMS
                          ? "Đăng nhập bằng mật khẩu"
                          : "Đăng nhập bằng SMS",
                      textColor: AppColors.blue,
                    ),
                  ],
                ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isSignInPage ? "Bạn chưa có tài khoản?" : "Bạn đã có tài khoản?"),
                  const SizedBox(width: 4),
                  CustomTextButton(
                    onPressed: () => setState(() {
                      isSignInPage = !isSignInPage;
                    }),
                    text: isSignInPage ? "Đăng ký" : "Đăng nhập",
                    textColor: AppColors.blue,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
