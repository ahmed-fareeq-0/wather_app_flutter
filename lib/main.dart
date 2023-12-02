import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/splashScreen.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'flutterfonts',
        scaffoldBackgroundColor: Color(0xff161A30),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
