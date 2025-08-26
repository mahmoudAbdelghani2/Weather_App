import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:flutter_application_1/controllers/API/weather_api.dart';

class WeatherController extends ChangeNotifier{
  WeatherModel? _weatherData;

  WeatherModel? get weatherData => _weatherData;

  Future<void> fetchWeather() async {
    try {
      _weatherData = await WeatherRepository().getWeatherByLocation();
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching weather data: $e");
    }
  }
}
