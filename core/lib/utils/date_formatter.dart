import 'package:intl/intl.dart';

class DateFormatter {
  String format(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm').format(dateTime.toLocal());
  }
}
