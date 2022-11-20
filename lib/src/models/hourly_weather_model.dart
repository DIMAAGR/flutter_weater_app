import 'package:flutter_weater_app/src/core/helpers/helpers.dart';
import 'package:flutter_weater_app/src/models/rain_weather_model.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  double? pop;
  Rain? rain;

  Hourly(
      {this.dt, this.temp, this.feelsLike, this.pressure, this.humidity, this.dewPoint, this.uvi, this.clouds, this.visibility, this.windSpeed, this.windDeg, this.windGust, this.weather, this.pop, this.rain});

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = Helpers.doubleParser(json['temp']);
    feelsLike = Helpers.doubleParser(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = Helpers.doubleParser(json['dew_point']);
    uvi = Helpers.doubleParser(json['uvi']);
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = Helpers.doubleParser(json['wind_speed']);
    windDeg = json['wind_deg'];
    windGust = Helpers.doubleParser(json['wind_gust']);
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    pop = Helpers.doubleParser(json['pop']);
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    data['wind_gust'] = windGust;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['pop'] = pop;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}
