import 'dart:developer';

import 'package:flutter_weater_app/src/models/weather_model.dart';
import 'package:flutter_weater_app/src/repositories/repository/fetch_weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

/// Para funcionar o GetX é necessário de uma classe de controle
/// essa classe será um extend de [GetxController].
class GlobalController extends GetxController {
  //

  // As variáveis no Getx são definidas usando o Rx como prefixo de cada uma das
  // mesmas e, no final de cada declaração é utilizado o **.obs** para definir
  // que elas são do tipo observables.

  // ===========================================================================
  // Variables
  // ===========================================================================

  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  final Rx<WeatherModel> _weatherModel = WeatherModel().obs;

  // ===========================================================================
  // Create instances for them to be called
  // ===========================================================================

  RxBool checkIsLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  Rx<WeatherModel> getWeatherModel() => _weatherModel;
  RxInt getIndex() => _currentIndex;

  // Dentro do Getx podemos adicionar ao controller funções de init e close.

  // ===========================================================================
  // onInit Method
  // ===========================================================================

  // it's similar to initState
  @override
  void onInit() async {
    //

    if (_isLoading.isTrue) {
      await getLocation();
      await getWeatherApiData();
    } else {
      getIndex();
    }

    super.onInit();
  }

  // ===========================================================================
  // onClose Method
  // ===========================================================================

  // it's similar to dispose
  @override
  void onClose() {
    super.onClose();
  }

  // ===========================================================================
  // Methods
  // ===========================================================================

  Future<void> getLocation() async {
    //

    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // Return if is service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location is not enabled');
    }

    // check locationPermission status
    locationPermission = await Geolocator.checkPermission();

    // check if locationPermission is deniedForever
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Permission are denied forever');
    }

    // check if locationPermission is denied
    else if (locationPermission == LocationPermission.denied) {
      //

      // request permission
      locationPermission = await Geolocator.requestPermission();

      // verify if locationPermission is not enabled
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }

    // get the current user location
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((location) {
      //

      // Update the latitude and longitude
      _latitude.value = location.latitude;
      _longitude.value = location.longitude;
      _isLoading.value = false;
    });

    //
  }

  Future<void> getWeatherApiData() async {
    //
    _isLoading.value = true;
    _weatherModel.value = await FetchWeatherData().getWeatherData(lat: _latitude.value, lon: _longitude.value);
    _isLoading.value = false;
    //
  }
}
