import 'package:intl/intl.dart';

class CoreUtils {
  CoreUtils._();

  static String currencyConverter(num input) =>
      NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(input);

  static bool validatePhoneNumber(String phoneNumber) {
    final phoneRegex =
        RegExp(r'^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$');

    return phoneRegex.hasMatch(phoneNumber);
  }
}
