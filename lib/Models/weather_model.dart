class WeatherModel {
  final String name;
  final String country;
  final String region;
  final double tempC;
  final String condition;
  final String icon;
  final int humidity;
  final double windKph;
  final String lastUpdated;

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
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['location']['name'] ?? '',
      country: json['location']['country'] ?? '',
      region: json['location']['region'] ?? '',
      tempC: (json['current']['temp_c'] as num).toDouble(),
      condition: json['current']['condition']['text'] ?? '',
      icon: 'https:${json['current']['condition']['icon']}',
      humidity: json['current']['humidity'] ?? 0,
      windKph: (json['current']['wind_kph'] as num).toDouble(),
      lastUpdated: json['current']['last_updated'] ?? '',
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
    };
  }

  WeatherModel copyWith({
    String? name,
    String? country,
    String? region,
    double? tempC,
    String? condition,
    String? icon,
    int? humidity,
    double? windKph,
    String? lastUpdated,
  }) {
    return WeatherModel(
      name: name ?? this.name,
      country: country ?? this.country,
      region: region ?? this.region,
      tempC: tempC ?? this.tempC,
      condition: condition ?? this.condition,
      icon: icon ?? this.icon,
      humidity: humidity ?? this.humidity,
      windKph: windKph ?? this.windKph,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
