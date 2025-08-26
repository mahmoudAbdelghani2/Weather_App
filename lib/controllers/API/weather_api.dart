import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:geolocator/geolocator.dart';

class WeatherRepository {
  final Dio dio = Dio();
  final String baseUrl = "https://api.weatherapi.com/v1/current.json";
  final String apiKey = "d2209a70879f4d068b0152158252008";

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    return await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<WeatherModel> getWeatherByLocation() async {
    try {
      final position = await _getCurrentLocation();

      final response = await dio.get(
        baseUrl,
        queryParameters: {
          "key": apiKey,
          "q": "${position.latitude},${position.longitude}",
        },
      );

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to load weather data: $e");
    }
  }
}
