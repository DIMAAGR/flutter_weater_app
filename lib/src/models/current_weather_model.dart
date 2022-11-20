import 'package:flutter_weater_app/src/core/helpers/helpers.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
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

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    // PARSED VALUES
    temp = Helpers.doubleParser(json['temp']);
    feelsLike = Helpers.doubleParser(json['feels_like']);
    dewPoint = Helpers.doubleParser(json['dew_point']);
    uvi = Helpers.doubleParser(json['uvi']);
    windSpeed = Helpers.doubleParser(json['wind_speed']);
    windGust = Helpers.doubleParser(json['wind_gust']);
    // NOT PARSED VALUES
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windDeg = json['wind_deg'];

    // LIST VALUES
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
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
    return data;
  }
}
