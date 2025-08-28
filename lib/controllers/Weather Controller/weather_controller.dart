// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:flutter_application_1/controllers/API/weather_api.dart';
import 'package:geolocator/geolocator.dart';

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
    _weather = null; // clear old data while loading
    notifyListeners();
    try {
      final response = await _weatherApi.fetchWeather(city: city);
      if (response.statusCode == 200) {
        final weatherData = WeatherModel.fromJson(response.data);
        updateWeather(weatherData);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
      _weather = null; // ensure card not shown on error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLocation() async {
    isLoading = true;
    error = null;
  _weather = null; // clear old data while loading
    notifyListeners();

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        throw Exception("Location permission denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final response = await _weatherApi.fetchWeather(
        lat: position.latitude,
        lon: position.longitude,
      );

      if (response.statusCode == 200) {
        final weatherData = WeatherModel.fromJson(response.data);
        updateWeather(weatherData);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
  _weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
