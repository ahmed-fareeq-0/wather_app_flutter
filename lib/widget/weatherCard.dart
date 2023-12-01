import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../controller/HomeController.dart';
import '../../constants/images.dart';

class WeatherCard extends StatelessWidget {
  final HomeController controller;

  WeatherCard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 3),
            child: Card(
              color: Color(0xff31304D),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 22, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            '${controller.currentWeatherData.name}'
                                .toUpperCase(),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'flutterfonts',
                                    ),
                          ),
                        ),
                        Center(
                          child: Text(
                            DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'flutterfonts',
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 25),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${controller.currentWeatherData.weather![0].description}',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.white,
                                    fontFamily: 'flutterfonts',
                                  ),
                            ),
                            Text(
                              'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'flutterfonts',
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: () {
                                switch (controller
                                    .currentWeatherData.weather![0].main) {
                                  case 'Snow':
                                    return Image.asset(Images.snow);
                                  case 'Clouds' || 'Clear':
                                    return LottieBuilder.asset(
                                        Images.cloudyAnim);
                                  case 'Rain':
                                    return Image.asset(Images.rain);
                                  case 'Mist' || 'Fog':
                                    return Image.asset(Images.Mist);
                                  default:
                                    return LottieBuilder.asset(
                                        Images.cloudyAnim);
                                }
                              }(),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                'الرياح ${controller.currentWeatherData.wind!.speed} كم/ساعة',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'flutterfonts',
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
