import 'package:dio/dio.dart';

class WeatherApi {
  final String baseUrl = "https://api.weatherapi.com/v1/current.json";
  final String apiKey = "d2209a70879f4d068b0152158252008";

  final Dio _dio = Dio();

  Future<Response> fetchWeather({String? city, double? lat, double? lon}) async {
    try {
      String query;

      if (city != null && city.isNotEmpty) {
        String normalizedCity = city
            .trim()
            .toLowerCase()
            .split(' ')
            .map((word) {
              if (word.isEmpty) return word;
              return word[0].toUpperCase() + word.substring(1);
            })
            .join(' ');
        query = normalizedCity;
      } else if (lat != null && lon != null) {
        query = "$lat,$lon";
      } else {
        query = "Cairo";
      }
      final response = await _dio.get(
        baseUrl,
        queryParameters: {
          'key': apiKey,
          'q': query,
        },
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        throw Exception('City not found or invalid name');
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Connection timeout, please try again');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection');
      }
      throw Exception('Unexpected error occurred');
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
