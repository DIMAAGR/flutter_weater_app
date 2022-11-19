class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = double.parse(json['day'].toString());
    min = double.parse(json['min'].toString());
    max = double.parse(json['max'].toString());
    night = double.parse(json['night'].toString());
    eve = double.parse(json['eve'].toString());
    morn = double.parse(json['morn'].toString());
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
