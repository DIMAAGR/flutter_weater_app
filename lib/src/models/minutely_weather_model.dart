import 'package:flutter_weater_app/src/core/helpers/helpers.dart';

class Minutely {
  double? dt;
  double? precipitation;

  Minutely({this.dt, this.precipitation});

  Minutely.fromJson(Map<String, dynamic> json) {
    dt = Helpers.doubleParser(json['dt']);
    precipitation = Helpers.doubleParser(json['precipitation']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['precipitation'] = precipitation;
    return data;
  }
}
