import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weathera/controllers/weather_data.dart';
import 'package:weathera/controllers/weather_model.dart';

// enum WeatherState { Rain, Sunny, Storm, Mist }

// extension ParseToString on WeatherState {
//   String toShortString() {
//     return this.toString().split('.').last;
//   }
// }

class Weather extends GetxController {
  var responseData = [];
  // WeatherState weatherState = WeatherState.Sunny;
  int weatherStateIndex = 1;
  String imagePath = 'assets/icons/Icon weather-day-sunny.svg';

  late WeatherModel model;
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/data.json');

    var w = WeatherModel.fromJson(jsonDecode(response));
    print(w);
    model = w;

    // ...
  }

  /// When alocating controller in memory , we call the function that fetching api data immediatly
  ///
  @override
  void onInit() {
    // setWeather('Mist');
    getHttp();

    // readJson();
    super.onInit();
  }

  List<List<Color>> bgColor = [
    [
      Color(0xff053D75),
      Color(0xff0098B1),
    ],
    [
      Color(0xffE36550),
      Color(0xffECBB69),
    ],
    [
      Color(0xff065963),
      Color(0xffE2EEA4),
    ],
    [
      Color(0xffB9C6D6),
      Color(0xff79838D),
    ],
  ];
  getGrideantBG() {
    // switch (weatherState) {
    //   case WeatherState.Rain:
    //     {
    //       weatherStateIndex = 0;
    //     }
    //     break;
    //   case WeatherState.Storm:
    //     {
    //       weatherStateIndex = 2;
    //     }
    //     break;
    //   case WeatherState.Mist:
    //     {
    //       weatherStateIndex = 3;
    //     }
    //     break;
    //   default:
    //     {
    //       weatherStateIndex = 1;
    //     }
    //     break;
    // }
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.1, 0.9],
      colors: bgColor[weatherStateIndex],
    );
  }

  Future<String> getHttp({String? city = 'Baghdad'}) async {
    // String currentCity;
    debugPrint('fetching api data');
    try {
      Dio dio = new Dio(BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (_) => true,
      ));

      var response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=${ApiKey}&q=$city&days=7&aqi=no&alerts=yes');
      // responseData = jsonDecode(response.data);
      var w = WeatherModel.fromJson(response.data);
// print(w.current.)
      if (response.statusCode == 200) {
        print(w.forecast.forecastday);
        model = w;
        setWeather(
          w.current.condition.text,
        );
        return '';
      } else {
        return 'something went wrong ≥ in else clause';
      }

      // print(response.data['forecast']['forecastday'][0]);
    } on SocketException catch (e) {
      // print('Error SocketException: $e');
      return e.message;
    } on TimeoutException catch (e) {
      // print('Error TimeoutException: $e');
      return e.message.toString();
    } on Error catch (e) {
      // print('Error: $e');
      // return e.toString();
      return 'an error accured, try again later';
    }
    // print(responseData);
  }

  setWeather(String text) {
    switch (text) {
      case 'Rain':
        {
          // return 0;
          weatherStateIndex = 0;
          imagePath = 'assets/icons/Icon feather-cloud-rain.svg';
        }
        break;

      case 'Storm':
        {
          weatherStateIndex = 2;
          // imagePath = 'assets/icons/Icon weather-thunderstorm.svg';
        }
        break;

      case 'Mist':
      case 'clear sky':
      case 'Partly cloudy':
        {
          weatherStateIndex = 3;
          // imagePath = 'assets/icons/Icon metro-weather3.svg';
        }
        break;
      default:
        {
          weatherStateIndex = 1;
          imagePath = 'assets/icons/Icon weather-day-sunny.svg';
        }

        break;
    }
  }
}
