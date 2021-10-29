import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weathera/controllers/weather.dart';
import 'package:weathera/models/models/weather_model.dart';
import 'package:weathera/screens/splash.dart';
import 'http.dart'; // make dio as global top-level variable

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  dio.options.receiveTimeout = 15000;
  await fetching();
  // print(c.model.current.humidity);
  runApp(const MyApp());
}

fetching() async {
  Weather c = Get.put(Weather());
  c.getHttp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weathera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
