import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Themes/app_color.dart';
import 'package:flutter_application_1/Views/Widgets/card_widget.dart';
import 'package:flutter_application_1/controllers/Weather%20Controller/weather_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherController>(
      context,
      listen: false,
    ).fetchWeatherByLocation();
  }

  @override
  Widget build(BuildContext context) {
    final weatherController = Provider.of<WeatherController>(context);
    final weather = weatherController.weather;
    final isLoading = weatherController.isLoading;
    final error = weatherController.error;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(color: AppColor.whiteText),
          ),
          centerTitle: true,
          backgroundColor: AppColor.background,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _search(context, _searchController),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (error != null) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              error,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      }
                      if (weather != null) {
                        return SingleChildScrollView(
                          child: CardWidget(weather: weather),
                        );
                      }
                      return const Center(
                        child: Text(
                          'No Weather Data',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _search(BuildContext context, TextEditingController searchController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: searchController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        hintText: 'Search for a city...',
        prefixIcon: Icon(Icons.search),
        suffix: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Provider.of<WeatherController>(
                  context,
                  listen: false,
                ).fetchWeatherByLocation();
                searchController.clear();
              },
              icon: Icon(Icons.update, color: AppColor.secondaryText),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Provider.of<WeatherController>(
                  context,
                  listen: false,
                ).fetchWeather(city: searchController.text);
                searchController.clear();
              },
              icon: Icon(Icons.telegram, color: AppColor.secondaryText),
            ),
          ],
        ),
        filled: true,
        fillColor: AppColor.card,
      ),
    ),
  );
}
