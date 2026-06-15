import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../services/ai_recommendation_service.dart';
import 'recommendation_result_screen.dart';

class BodyConditionScreen extends StatefulWidget {
  final WeatherInfo? weather;
  final String date;
  final String situation;

  const BodyConditionScreen({
    super.key,
    this.weather,
    required this.date,
    required this.situation,
  });

  @override
  State<BodyConditionScreen> createState() => _BodyConditionScreenState();
}

class _BodyConditionScreenState extends State<BodyConditionScreen> {
  String _selectedCondition = "보통";

  final List<Map<String, dynamic>> _conditions = [
    {"title": "보통", "icon": Icons.sentiment_satisfied_alt},
    {"title": "피곤함", "icon": Icons.bedtime_outlined},
    {"title": "활동적", "icon": Icons.directions_run},
    {"title": "감기기운", "icon": Icons.sick_outlined},
    {"title": "더위를 많이 탐", "icon": Icons.wb_sunny_outlined},
    {"title": "추위를 많이 탐", "icon": Icons.ac_unit},
  ];

  bool _isLoading = false;

  Future<void> _getRecommendation() async {
    setState(() => _isLoading = true);

    final aiService = AIRecommendationService();

    try {
      final results = await aiService.requestAICoordi(
        weatherStatus: widget.weather?.status ?? "맑음",
        temperature: widget.weather?.temperature ?? 20.0,
        situation: widget.situation,
        bodyCondition: _selectedCondition,
        items: [],
        date: widget.date,
      );

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecommendationResultScreen(
            results: results,
            onSavedOutfit: (result, isSaved) {},
            isAiMode: true,
            temperature: widget.weather?.temperature,
            situation: widget.situation,
            date: widget.date,
            bodyCondition: _selectedCondition,
          ),
        ),
      );
    } catch (e) {
      debugPrint("AI 추천 오류: $e");
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
          "오늘의 컨디션",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "오늘 몸 상태는 어떤가요?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "컨디션에 따라 AI가 더 정확하게 추천해요",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),

            const SizedBox(height: 24),

            // 🔥 컨디션 선택 카드형 UI
            Expanded(
              child: ListView.separated(
                itemCount: _conditions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _conditions[index];
                  final isSelected =
                      _selectedCondition == item["title"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCondition = item["title"];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF4A261)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item["icon"],
                            color: isSelected
                                ? Colors.white
                                : Colors.black54,
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: isSelected
                                ? Colors.white
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 🚀 AI 버튼
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4A261),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.auto_awesome, color: Colors.white),
                label: _isLoading
                    ? const Text("AI가 코디 분석 중...")
                    : const Text(
                  "AI 코디 추천받기",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _isLoading ? null : _getRecommendation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}