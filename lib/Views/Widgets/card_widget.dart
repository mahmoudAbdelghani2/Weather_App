// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weather_model.dart';
import 'package:flutter_application_1/constants/condition.dart';
import 'package:flutter_application_1/controllers/Themes/app_color.dart';

class CardWidget extends StatefulWidget {
  final WeatherModel weather;
  const CardWidget({super.key, required this.weather});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: AppColor.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: AppColor.cardShadow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: AppColor.secondaryText),
                    const SizedBox(width: 5),
                    Text(
                      ('${widget.weather.name}, '),
                      style: TextStyle(
                        color: AppColor.whiteText,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      (widget.weather.country),
                      style: TextStyle(
                        color: AppColor.secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Condition.weatherIcons[widget.weather.condition
                            .toLowerCase()] ??
                        Icons.cloud_queue,
                    color: AppColor.iconBlue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.weather.tempC}°C',
                    style: TextStyle(
                      color: AppColor.whiteText,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Builder(builder: (context) {
                final key = widget.weather.condition.toLowerCase();
                final bgColor = Condition.weatherBackgroundColors[key] ??
                    Colors.blueGrey.withOpacity(0.3);
                final iconUrl = Condition.weatherIconUrls[key];
                return Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: iconUrl == null
                      ? Icon(Icons.cloud_queue, color: AppColor.whiteText)
                      : Image.network(
                          iconUrl,
                          height: 60,
                          width: 60,
                          errorBuilder: (c, e, s) => Icon(
                            Icons.cloud_off,
                            color: AppColor.whiteText,
                          ),
                        ),
                );
              }),
              const SizedBox(height: 10),
              Text(
                widget.weather.condition,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondaryText,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.thermostat, color: AppColor.secondaryText),
                      const SizedBox(height: 3),
                      Text(
                        'Feels Like',
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${widget.weather.tempC + 2}°C',
                        style: TextStyle(
                          color: AppColor.whiteText,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.water_drop_rounded,
                        color: AppColor.secondaryText,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${widget.weather.humidity}%',
                        style: TextStyle(
                          color: AppColor.whiteText,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.air, color: AppColor.secondaryText),
                      const SizedBox(height: 3),
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${widget.weather.windKph} km/h',
                        style: TextStyle(
                          color: AppColor.whiteText,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: AppColor.twoCard,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.speed, color: AppColor.secondaryText),
                            const SizedBox(height: 8),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                color: AppColor.secondaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${widget.weather.pressure} mb',
                              style: TextStyle(
                                color: AppColor.whiteText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "|",
                          style: TextStyle(
                            color: AppColor.whiteText,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.update, color: AppColor.secondaryText),
                            const SizedBox(height: 8),
                            Text(
                              'Last Updated',
                              style: TextStyle(
                                color: AppColor.secondaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Now',
                              style: TextStyle(
                                color: AppColor.whiteText,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
