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
    Provider.of<WeatherController>(context, listen: false).fetchWeather();
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
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _search(context, _searchController),
                const SizedBox(height: 10),
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (error != null)
                  Center(
                    child: Text(
                      error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                else if (weather != null)
                  CardWidget(weather: weather)
                else
                  const Center(child: Text('No Weather Data')),
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
                Provider.of<WeatherController>(context, listen: false)
                    .fetchWeather(city: "Cairo");
                searchController.clear();
              },
              icon: Icon(Icons.update, color: AppColor.secondaryText),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                Provider.of<WeatherController>(context, listen: false)
                    .fetchWeather(city: searchController.text);
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
