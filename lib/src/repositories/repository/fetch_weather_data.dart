import 'dart:convert';

import 'package:flutter_weater_app/src/core/constants.dart';
import 'package:flutter_weater_app/src/core/services/networking_service.dart';
import 'package:flutter_weater_app/src/models/weather_model.dart';
import 'package:flutter_weater_app/src/repositories/interfaces/fetch_weather_data_interface.dart';
import 'package:http/http.dart' as http;

class FetchWeatherData extends IFetchWeatherData {
  FetchWeatherData() : super(networking: Networking(url: Const.apiUrl));

  @override
  Future<WeatherModel> getWeatherData({required double lat, required double lon}) async {
    http.Response response = await networking.get(path: '?lat=$lat&lon=$lon&appid=${Const.apiKey}&units=metric&lang=pt_br');

    return WeatherModel.fromJson(jsonDecode(response.body));
  }
}
