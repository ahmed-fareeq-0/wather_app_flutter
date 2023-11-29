import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/HomeController.dart';

import '../model/fiveDaysData.dart';

class MyChart extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.fiveDaysData.length,
        itemBuilder: (context, index) {
          FiveDayData data = controller.fiveDaysData[index];
          return Container(
            width: 140,
            child: Card(
              color: Color(0xff31304D),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (data != null) ? '${data.dateTime}' : '',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    (data != null)
                        ? '${(data.temp!).round().toString()}\u2103'
                        : '',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
