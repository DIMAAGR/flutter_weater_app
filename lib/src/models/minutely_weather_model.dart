class Minutely {
  double? dt;
  double? precipitation;

  Minutely({this.dt, this.precipitation});

  Minutely.fromJson(Map<String, dynamic> json) {
    dt = double.parse(json['dt'].toString());
    precipitation = double.parse(json['precipitation'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['precipitation'] = precipitation;
    return data;
  }
}
