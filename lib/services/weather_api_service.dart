class WeatherApiService {
  static Future<Map<String, dynamic>?> fetchWeatherData(String city) async {
    final Map<String, dynamic> error = {"error": "Unable to fetch data"};

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (city == 'Invalid City') {
        return error;
      }

      return {
        'city': city,
        'temperature': city == 'London'
            ? 15.0
            : (city == 'Tokyo' ? 25.0 : 22.5),
        'description': city == 'London'
            ? 'Rainy'
            : (city == 'Tokyo' ? 'Cloudy' : 'Sunny'),
        'humidity': city == 'London'
            ? 85
            : city == 'Tokyo'
            ? 70
            : 65,
        'windSpeed': city == 'London' ? 8.5 : (city == 'Tokyo' ? 5.2 : 12.3),
        'icon': city == 'London' ? '🌧️' : (city == 'Tokyo' ? '☁️' : '☀️'),
      };
    } catch (e) {
      return error;
    }
  }
}
