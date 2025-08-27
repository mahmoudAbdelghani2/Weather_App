import 'package:flutter/material.dart';

class Condition {
  static final Map<String, IconData> weatherIcons = {
    'clear': Icons.wb_sunny,
    'sunny': Icons.wb_sunny,
    'partly cloudy': Icons.wb_cloudy,
    'cloudy': Icons.wb_cloudy,
    'overcast': Icons.wb_cloudy,
    'rain': Icons.grain,
    'light rain': Icons.grain,
    'heavy rain': Icons.grain,
    'thunderstorm': Icons.flash_on,
    'storm': Icons.flash_on,
    'snow': Icons.ac_unit,
    'fog': Icons.blur_on,
    'mist': Icons.blur_on,
    'haze': Icons.blur_on,
    'wind': Icons.air,
    'windy': Icons.air,
    'dust': Icons.cloud,
    'sandstorm': Icons.cloud,
    'clear night': Icons.nightlight_round,
    'cloudy night': Icons.cloud,
    'overcast night': Icons.cloud,
  };
  static final Map<String, String> weatherIconUrls = {
    'clear': 'https://static.thenounproject.com/png/4411317-200.png',
    'sunny': 'https://static.thenounproject.com/png/4411317-200.png',
    'partly cloudy': 'https://static.thenounproject.com/png/4411318-200.png',
    'cloudy': 'https://static.thenounproject.com/png/4411324-200.png',
    'overcast': 'https://static.thenounproject.com/png/4411324-200.png',
    'rain': 'https://static.thenounproject.com/png/4411329-200.png',
    'light rain': 'https://static.thenounproject.com/png/4411329-200.png',
    'heavy rain': 'https://static.thenounproject.com/png/4411329-200.png',
    'thunderstorm': 'https://static.thenounproject.com/png/4411333-200.png',
    'storm': 'https://static.thenounproject.com/png/4411333-200.png',
    'snow': 'https://static.thenounproject.com/png/4411320-200.png',
    'fog': 'https://static.thenounproject.com/png/4411327-200.png',
    'mist': 'https://static.thenounproject.com/png/4411327-200.png',
    'haze': 'https://static.thenounproject.com/png/4411327-200.png',
    'wind': 'https://static.thenounproject.com/png/4411341-200.png',
    'windy': 'https://static.thenounproject.com/png/4411341-200.png',
    'dust': 'https://static.thenounproject.com/png/4411325-200.png',
    'sandstorm': 'https://static.thenounproject.com/png/4411325-200.png',
    'clear night': 'https://static.thenounproject.com/png/4411322-200.png',
    'cloudy night': 'https://static.thenounproject.com/png/4411324-200.png',
    'overcast night': 'https://static.thenounproject.com/png/4411324-200.png',
  };

  static final Map<String, Color> weatherBackgroundColors = {
    'clear': Colors.lightBlueAccent, // سماء صافية
    'sunny': Colors.orangeAccent, // مشمس
    'partly cloudy': Colors.blueGrey, // غائم جزئي
    'cloudy': Colors.grey, // غائم
    'overcast': Colors.blueGrey.shade700, // غيوم كثيفة
    'rain': Colors.indigo, // مطر
    'light rain': Colors.indigoAccent, // مطر خفيف
    'heavy rain': Colors.blue.shade900, // مطر غزير
    'thunderstorm': Colors.deepPurple, // عاصفة رعدية
    'storm': Colors.deepPurple.shade900, // عاصفة قوية
    'snow': Colors.blue.shade100, // ثلج
    'fog': Colors.blueGrey.shade200, // ضباب
    'mist': Colors.blueGrey.shade300, // شبورة
    'haze': Colors.blueGrey.shade400, // غباش
    'wind': Colors.teal, // رياح
    'windy': Colors.teal.shade700, // رياح قوية
    'dust': Colors.brown, // تراب
    'sandstorm': Colors.brown.shade700, // عاصفة ترابية
    'clear night': Colors.indigo.shade800, // ليل صافي
    'cloudy night': Colors.blueGrey.shade800, // ليل غائم
    'overcast night': Colors.black87, // ليل بغيوم كثيفة
  };
}
