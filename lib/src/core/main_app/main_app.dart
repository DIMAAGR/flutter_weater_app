import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/application_settings.dart';
import 'package:flutter_weater_app/src/view/home/home_view.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // ===========================================================================
  // MainApp.dart
  // ===========================================================================

  /// Algumas Informações sobre o projeto: como esse projeto é escrito usando o
  /// getX, ao invés de usarmos o [MaterialApp], estaremos utilizando o
  /// [GetMaterialApp].

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeView(),
      title: ApplicationSettings.applicationName,
      debugShowCheckedModeBanner: ApplicationSettings.showDebugBanner,
    );
  }
}
