class DateFormatter {
  String format(DateTime unformattedDate) {
    String formattedDate =
        unformattedDate.add(const Duration(hours: 2)).toString();
    String day = formattedDate.substring(0, 10);
    String hour = formattedDate.substring(11, 16);
    return '$day $hour';
  }
}
