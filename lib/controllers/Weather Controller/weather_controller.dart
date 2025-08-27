import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:flutter_application_1/controllers/API/weather_api.dart';

class WeatherController extends ChangeNotifier {
  WeatherModel? _weather;
  final WeatherApi _weatherApi = WeatherApi();
  bool isLoading = false;
  String? error;

  WeatherModel? get weather => _weather;

  void updateWeather(WeatherModel newWeather) {
    _weather = newWeather;
    notifyListeners();
  }

  Future<void> fetchWeather({String? city}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _weatherApi.fetchWeather(city);
      if (response.statusCode == 200) {
        final weatherData = WeatherModel.fromJson(response.data);
        updateWeather(weatherData);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
