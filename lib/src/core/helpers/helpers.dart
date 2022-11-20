import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static String convertTimestampToHumanHour(int timestamp) {
    DateTime convertedToDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String convertedDateTimeToString = DateFormat('HH:mm').format(convertedToDateTime);
    return convertedDateTimeToString;
  }

  static double doubleParser(dynamic value) {
    return double.parse(value.toString());
  }

  static String convertTimestampToHumanDate(int day) {
    DateTime convertedToDateTime = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String convertedDateTimeToString = DateFormat('EEE', 'pt_BR').format(convertedToDateTime);
    return convertedDateTimeToString;
  }
}
