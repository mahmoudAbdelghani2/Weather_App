import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weather_model.dart';

class CardWidget extends StatefulWidget {
  final WeatherModel weatherData;
  const CardWidget({super.key, required this.weatherData});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final weather = widget.weatherData;

    return Card(
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.15),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: Colors.white70),
                const SizedBox(width: 5),
                Text(
                  "${weather.name}, ${weather.country}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Temperature + Icon + Condition
            Column(
              children: [
                Image.network(
                  weather.icon,
                  width: 48,
                  height: 48,
                ),
                Text(
                  "${weather.tempC.toStringAsFixed(0)}°C",
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  weather.condition,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Extra info row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(Icons.thermostat, "Feels like", "${(weather.tempC + 2).toStringAsFixed(0)}°C"),
                _buildInfoItem(Icons.water_drop, "Humidity", "${weather.humidity}%"),
                _buildInfoItem(Icons.air, "Wind", "${weather.windKph.toStringAsFixed(0)} km/h"),
              ],
            ),
            const SizedBox(height: 16),

            // Extra info row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(Icons.speed, "Pressure", "1007 mb"), // لو مش في الموديل، ثابت مؤقت
                _buildInfoItem(Icons.update, "Last updated", "Now"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
