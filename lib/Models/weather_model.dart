class WeatherModel {
  final String name;
  final String country;
  final String region;
  final int tempC;
  final String condition;
  final String icon;
  final double humidity;
  final double windKph;
  final String lastUpdated;
  final double lat;
  final double lon;
  final double pressure;

  WeatherModel({
    required this.name,
    required this.country,
    required this.region,
    required this.tempC,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windKph,
    required this.lastUpdated,
    required this.lat,
    required this.lon,
    required this.pressure,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'],
      country: json['location']['country'],
      region: json['location']['region'],
      tempC: (json['current']['temp_c'] as num).toInt(),
      condition: json['current']['condition']['text'],
      icon: 'https:${json['current']['condition']['icon']}',
      humidity: (json['current']['humidity'] as num).toDouble(),
      windKph: (json['current']['wind_kph'] as num).toDouble(),
      lastUpdated: json['current']['last_updated'],
      lat: (json['location']['lat'] as num).toDouble(),
      lon: (json['location']['lon'] as num).toDouble(),
      pressure: (json['current']['pressure_mb'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "country": country,
      "region": region,
      "tempC": tempC,
      "condition": condition,
      "icon": icon,
      "humidity": humidity,
      "windKph": windKph,
      "lastUpdated": lastUpdated,
      "lat": lat,
      "lon": lon,
      "pressure": pressure,
    };
  }
}
