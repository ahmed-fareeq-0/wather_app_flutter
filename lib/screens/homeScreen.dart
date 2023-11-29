import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import '../../controller/HomeController.dart';
import '../../widget/myList.dart';
import '../../widget/myChart.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: TextField(
                        textAlign: TextAlign.right,
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          prefix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'البحث',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment(0.0, 1.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight: (MediaQuery.of(context).size.height / 3),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Card(
                                    color: Color(0xff31304D),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 22, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  '${controller.currentWeatherData.name}'
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'flutterfonts',
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    '${controller.currentWeatherData.weather![0].description}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontFamily:
                                                              'flutterfonts',
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
                                                            fontFamily:
                                                                'flutterfonts'),
                                                  ),
                                                  Text(
                                                    'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 120,
                                                    height: 120,
                                                    child: LottieBuilder.asset(
                                                        Images.cloudyAnim),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'مدينة اخرى'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 18,
                                      fontFamily: 'flutterfonts',
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyList(),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                  Text(
                                    'توقعات الأيام القادمة',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontSize: 18,
                                          fontFamily: 'flutterfonts',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            MyChart(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
