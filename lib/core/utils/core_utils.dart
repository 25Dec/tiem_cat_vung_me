import 'package:intl/intl.dart';

class CoreUtils {
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
}
