import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherInfo {
  final String status;
  final double temperature;
  final String cityName;

  WeatherInfo({required this.status, required this.temperature, required this.cityName});
}

class WeatherService {
  Future<WeatherInfo> fetchCurrentWeather() async {
    try {
      // 1. 권한 요청 (에뮬레이터에서 거부해도 진행)
      await Geolocator.requestPermission();

      // 2. 위치 가져오기 (타임아웃 3초)
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: const Duration(seconds: 3),
      );

      final apiKey = dotenv.env['WEATHER_API_KEY'];
      if (apiKey == null) throw Exception("API Key missing");

      final url = 'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric&lang=kr';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherInfo(
          cityName: data['name'],
          status: data['weather'][0]['description'],
          temperature: (data['main']['temp'] as num).toDouble(),
        );
      }
    } catch (e) {
      print("날씨 로드 실패, 기본값 사용: $e");
    }

    // API 호출이 실패해도 항상 반환 (앱 멈춤 방지)
    return WeatherInfo(status: "맑음", temperature: 20.0, cityName: "대구");
  }
}