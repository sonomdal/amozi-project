import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import 'date_select_screen.dart';
import '../models/recommendation_history.dart';
import '../models/view_recommendation_result.dart';

class HomeScreen extends StatefulWidget {
  final RecommendationHistory? history;
  final Function(ViewRecommendationResult, bool) onSavedOutfit;

  const HomeScreen({
    super.key,
    required this.history,
    required this.onSavedOutfit,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherInfo? _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final info = await WeatherService().fetchCurrentWeather();
    if (mounted) {
      setState(() {
        _weather = info;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: const Text(
          'AMOZI',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: _isLoading
                  ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 16, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(
                    "${_weather?.cityName ?? '-'} "
                        "${_weather?.temperature.toInt() ?? 0}°C",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 🧠 메인 타이틀
            const Text(
              '오늘 뭐 입지?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '날씨 + 상황 + 컨디션을 분석해서\nAI가 코디를 추천해드려요',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                height: 1.4,
              ),
            ),

            const Spacer(),

            // 📦 날씨 카드 (추가 - 앱 퀄리티 핵심)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.wb_sunny,
                    color: Color(0xFFF4A261),
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _weather?.cityName ?? "위치 불러오는 중",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _isLoading
                            ? "날씨 정보 로딩 중..."
                            : "${_weather?.temperature.toInt() ?? 0}°C · ${_weather?.status ?? ''}",
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🚀 시작 버튼
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4A261),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: (_weather == null)
                    ? null
                    : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DateSelectScreen(
                        history: widget.history!,
                        onSavedOutfit: widget.onSavedOutfit,
                        initialWeather: _weather!,
                      ),
                    ),
                  );
                },
                child: const Text(
                  '코디 추천 시작하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}