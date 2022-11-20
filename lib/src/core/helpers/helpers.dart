import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static String convertTimestampToHumanDate(int timestamp) {
    DateTime convertedToDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String convertedDateTimeToString = DateFormat('HH:mm').format(convertedToDateTime);
    return convertedDateTimeToString;
  }

  static double doubleParser(dynamic value) {
    return double.parse(value.toString());
  }
}
