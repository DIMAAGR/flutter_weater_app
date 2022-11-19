// =============================================================================
// Repository Pattern
// =============================================================================

import 'package:flutter_weater_app/src/core/services/networking_service.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';

abstract class IFetchWeatherData {
  Networking networking;

  IFetchWeatherData({required this.networking});

  /// get weather data
  Future<WeatherModel> getWeatherData({required double lat, required double lon});
}
