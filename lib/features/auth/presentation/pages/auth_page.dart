import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_text_button.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/res/app_colors.dart';
import '../../../../core/routes/app_route_constants.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  final bool? isSignUpPage;

  const AuthPage({
    super.key,
    this.isSignUpPage,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  bool toggleIsSignUpPage = false;

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void moveToVerifyOtpPage() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SendOtpEvent(phoneNumber: phoneNumberController.text),
      );
      GoRouter.of(context).pushNamed(
        AppPage.verifyOtp.toName,
        extra: {"phoneNumber": phoneNumberController.text},
      );
    }
  }

  String? phoneNumberValidator(String? value) {
    bool isPhoneNumberValid = CoreUtils.validatePhoneNumber(value!);
    return isPhoneNumberValid ? null : "Số điện thoại không chính xác";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.isSignUpPage ?? false) || toggleIsSignUpPage ? "Đăng ký" : "Đăng nhập",
        ),
      ),
      body: Form(
        key: formKey,
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
                hintText: 'Số điện thoại',
                validator: phoneNumberValidator,
                prefixIcon: FluentIcons.phone_24_regular,
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
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
              const SizedBox(height: 8),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (widget.isSignUpPage ?? false) || toggleIsSignUpPage
                        ? "Bạn đã có tài khoản?"
                        : "Bạn chưa có tài khoản?",
                  ),
                  const SizedBox(width: 4),
                  CustomTextButton(
                    onPressed: () => setState(() {
                      toggleIsSignUpPage = !toggleIsSignUpPage;
                    }),
                    text: (widget.isSignUpPage ?? false) || toggleIsSignUpPage
                        ? "Đăng nhập"
                        : "Đăng ký",
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
