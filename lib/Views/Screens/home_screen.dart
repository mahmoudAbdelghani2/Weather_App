// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:flutter_application_1/Views/Widgets/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(16.0), child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _search(),
            const SizedBox(height: 20),
            CardWidget(weatherData: weatherData),
          ],
        ),)
      ),
    );
  }
}
Widget _search() {
  return TextFormField(
    style: const TextStyle(color: Colors.white), // النص أبيض
    decoration: InputDecoration(
      hintText: 'Search for a city...',
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),

      filled: true,
      fillColor: Colors.white.withOpacity(0.15),

      prefixIcon: const Icon(Icons.search, color: Colors.white70),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: Colors.white70),
      ),

      // زرار السيرش (السهم جوه دائرة)
      suffixIcon: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            // هنا هتضيف action السيرش
          },
          icon: const Icon(Icons.arrow_forward, color: Colors.blue),
        ),
      ),
    ),
  );
}
