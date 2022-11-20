import 'package:flutter_weater_app/src/core/helpers/helpers.dart';

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = Helpers.doubleParser(json['day']);
    min = Helpers.doubleParser(json['min']);
    max = Helpers.doubleParser(json['max']);
    night = Helpers.doubleParser(json['night']);
    eve = Helpers.doubleParser(json['eve']);
    morn = Helpers.doubleParser(json['morn']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}
