import 'package:intl/intl.dart';

class CoreUtils {
  CoreUtils._();

  static String currencyConverter(num input) =>
      NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(input);
}
