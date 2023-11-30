import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/homeScreen.dart'; // قم بتعديلها حسب هيكلة مشروعك

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // استخدم Timer لتأخير الانتقال إلى الشاشة التالية بعد مرور فترة زمنية معينة
    Timer(
      Duration(seconds: 2), // يمكنك تغيير هذه الفترة حسب احتياجاتك
      () {
        // قم بالانتقال إلى الشاشة التالية
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(), // قم بتعديلها حسب هيكلة مشروعك
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FlutterLogo(size: 100),
            SizedBox(height: 16),
            Text('الطقس',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            SizedBox(
              height: 50,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
