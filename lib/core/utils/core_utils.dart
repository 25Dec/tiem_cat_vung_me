import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/widgets/custom_text_form_field.dart';
import '../res/app_colors.dart';

class CoreUtils {
  CoreUtils._();

  static String currencyConverter(num input) =>
      NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(input);

  static bool validatePhoneNumber(String phoneNumber) {
    final phoneRegex =
        RegExp(r'^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  static bool validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,32}$');
    return passwordRegex.hasMatch(password);
  }

  static bool validateEmail(String email) {
    final emailRegex = RegExp(r"""
  ^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0D\x0A))?(\x20|\x09)+)?(([\x01-\x08\x0B\x0C\x0E-\x1F\x7F]|\x21|\x23-\x5B|\x5D-\x7E]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)(((\x20|\x09)*(\x0D\x0A))?(\x20|\x09)+)?)\x22))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$
  """);

    return emailRegex.hasMatch(email);
  }

  static Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    required String content,
    String? cancelText,
    required String acceptText,
    void Function()? onCancel,
    void Function()? onAccpet,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(title),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          content: Text(content),
          actions: [
            if (cancelText != null)
              TextButton(
                child: Text(cancelText),
                onPressed: () {
                  Navigator.of(context).pop();
                  onCancel!();
                },
              ),
            TextButton(
              child: Text(acceptText),
              onPressed: () {
                Navigator.of(context).pop();
                onAccpet!();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showCustomTextFieldBottomSheet(
    BuildContext context, {
    required String bottomSheetTitle,
    TextEditingController? textController,
    String textFieldLabel = "",
    bool hasTextField = false,
    bool hasGenderField = false,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
              color: AppColors.white2,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      bottomSheetTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      FluentIcons.dismiss_16_regular,
                      size: 20,
                    ),
                  ),
                ),
                if (hasTextField)
                  Positioned(
                    top: 50,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: CustomTextFormField(
                        controller: textController,
                        hintText: textFieldLabel,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Xác nhận"),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showCustomDatePicker(
    BuildContext context,
  ) async {
    showDatePicker(
      context: context,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );
  }
}
