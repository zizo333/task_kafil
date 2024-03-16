import 'package:intl/intl.dart';

class AppConverter {
  const AppConverter._();

  static String dateTimeToText(DateTime date) {
    final format = DateFormat('yyyy-MM-dd');
    return format.format(date);
  }

  static DateTime? textToDateTime(String date) {
    return DateTime.tryParse(date);
  }
}
