import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/Screens/home_screen.dart';
import 'package:flutter_application_1/controllers/Weather%20Controller/weather_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherController(),
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: HomeScreen(),
    );
  }
}