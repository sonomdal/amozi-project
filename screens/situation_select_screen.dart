import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/recommendation_history.dart';
import '../models/view_recommendation_result.dart';
import 'body_condition_screen.dart';

class StepSituationScreen extends StatefulWidget {
  final RecommendationHistory history;
  final Function(ViewRecommendationResult, bool) onSavedOutfit;
  final WeatherInfo? weather;
  final String date;

  const StepSituationScreen({
    super.key,
    required this.history,
    required this.onSavedOutfit,
    this.weather,
    required this.date,
  });

  @override
  State<StepSituationScreen> createState() => _StepSituationScreenState();
}

class _StepSituationScreenState extends State<StepSituationScreen> {
  String _selectedSituation = "일상";

  final List<Map<String, dynamic>> _situations = [
    {
      "title": "일상",
      "subtitle": "편하게 입는 데일리 룩",
      "icon": Icons.home_outlined
    },
    {
      "title": "데이트",
      "subtitle": "호감도 상승 로맨틱 스타일",
      "icon": Icons.favorite_border
    },
    {
      "title": "출근",
      "subtitle": "단정하고 프로페셔널하게",
      "icon": Icons.work_outline
    },
    {
      "title": "캠퍼스",
      "subtitle": "편안하고 캐주얼한 대학생 룩",
      "icon": Icons.school_outlined
    },
    {
      "title": "운동",
      "subtitle": "활동성과 기능성 중심",
      "icon": Icons.fitness_center
    },
    {
      "title": "여행",
      "subtitle": "편하고 사진 잘 나오는 스타일",
      "icon": Icons.flight_takeoff
    },
    {
      "title": "결혼식",
      "subtitle": "격식 있는 하객 스타일",
      "icon": Icons.celebration_outlined
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: const Text(
          "상황 선택",
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
              "어디에 가시나요?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "상황에 맞는 코디를 추천해드릴게요",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 상황 선택 카드 리스트
            Expanded(
              child: ListView.separated(
                itemCount: _situations.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _situations[index];
                  final isSelected =
                      _selectedSituation == item["title"];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSituation = item["title"];
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
                            size: 26,
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  item["subtitle"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.white70
                                        : Colors.black45,
                                  ),
                                ),
                              ],
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

            // 🔥 하단 메인 버튼
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
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                label: const Text(
                  "다음",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BodyConditionScreen(
                        weather: widget.weather,
                        date: widget.date,
                        situation: _selectedSituation,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}