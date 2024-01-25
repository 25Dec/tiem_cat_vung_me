import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/res/app_colors.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_text_button.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  Timer? timer;
  int maxSeconds = 60;
  late int seconds = maxSeconds;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        timer!.cancel();
      }
    });
  }

  void resetTimer() {
    setState(() => seconds = maxSeconds);
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhập vào mã xác minh"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(color: AppColors.black2),
                children: [
                  TextSpan(text: "Mã xác thực (OTP) đã được gửi qua "),
                  TextSpan(
                      text: "Tin nhắn ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "của số")
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "(+84) 964 886 660",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 16),
            Pinput(
              length: 6,
              onCompleted: (otp) {
                authBloc.add(VerifyOtpEvent(otp: otp));
              },
            ),
            const SizedBox(height: 16),
            if (seconds > 0)
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: AppColors.black2),
                  children: [
                    const TextSpan(text: "Vui lòng chờ "),
                    TextSpan(
                      text: "$seconds ",
                      style: const TextStyle(color: AppColors.pink),
                    ),
                    const TextSpan(text: "giây để gửi lại Mã xác thực mới.")
                  ],
                ),
              ),
            if (seconds == 0)
              const Text(
                "Bạn vẫn chưa nhận được mã xác thực? Vui lòng kiểm tra số điện thoại đã nhập.",
                textAlign: TextAlign.center,
              ),
            if (seconds == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Nhấn"),
                  CustomTextButton(
                    onPressed: () {
                      resetTimer();
                    },
                    text: "Gửi lại",
                    textColor: AppColors.blue,
                  ),
                  const Text("để nhận lại mã xác thực."),
                ],
              )
          ],
        ),
      ),
    );
  }
}
