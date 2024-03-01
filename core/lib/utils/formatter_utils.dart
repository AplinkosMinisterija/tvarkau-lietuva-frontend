import 'package:intl/intl.dart';

class FormatterUtils {
  String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm').format(dateTime.toLocal());
  }

  String getFormattedTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime.toLocal());
  }

  List<String> formatImageUrls(List<String> unformattedImageUrls) {
    List<String> formattedUrls = [];
    for (var image in unformattedImageUrls) {
      if (image.endsWith('.heic') || image.endsWith('.heif')) {
        var convertedString = image.substring(0, image.length - 5);
        convertedString = '$convertedString.jpg';
        formattedUrls.add(convertedString);
      } else {
        formattedUrls.add(image);
      }
    }
    return formattedUrls;
  }
}
