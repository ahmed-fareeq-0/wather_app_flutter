import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controller/HomeController.dart';

import '../constants/images.dart';
import '../model/currentWeatherData.dart';

class MyList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        reverse: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data;
          (controller.dataList.length > 0)
              ? data = controller.dataList[index]
              : data = null;
          return Container(
            width: 140,
            child: Card(
              color: Color(0xff31304D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (data != null) ? '${data.name}' : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                    Text(
                      (data != null)
                          ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                          : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'flutterfonts',
                          ),
                    ),
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: () {
                        switch (
                            (data != null) ? '${data.weather![0].main}' : '') {
                          case 'Snow':
                            return Image.asset(Images.snow);
                          case 'Clouds' || 'Clear':
                            return LottieBuilder.asset(Images.cloudyAnim);
                          case 'Rain':
                            return Image.asset(Images.rain);
                          case 'Mist' || 'Fog':
                            return Image.asset(Images.Mist);
                          default:
                            return Container();
                        }
                      }(),
                    ),
                    Text(
                      (data != null) ? '${data.weather![0].description}' : '',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white,
                            fontFamily: 'flutterfonts',
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
