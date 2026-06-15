import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/recommendation_history.dart';
import '../models/view_recommendation_result.dart';
import 'situation_select_screen.dart';

class DateSelectScreen extends StatefulWidget {
  final RecommendationHistory history;
  final Function(ViewRecommendationResult, bool) onSavedOutfit;
  final WeatherInfo? initialWeather;

  const DateSelectScreen({
    super.key,
    required this.history,
    required this.onSavedOutfit,
    this.initialWeather,
  });

  @override
  State<DateSelectScreen> createState() => _DateSelectScreenState();
}

class _DateSelectScreenState extends State<DateSelectScreen> {
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _pickDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFF4A261),
          ),
        ),
        child: child!,
      ),
    );

    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFF4A261),
          ),
        ),
        child: child!,
      ),
    );

    if (time == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayDate =
        "${_selectedDateTime.year}년 ${_selectedDateTime.month}월 ${_selectedDateTime.day}일";

    final displayTime =
        "${_selectedDateTime.hour.toString().padLeft(2, '0')}:"
        "${_selectedDateTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: const Text(
          "언제 입을 옷인가요?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              "날짜와 시간을 선택해주세요",
              style: TextStyle(
                fontSize: 22,
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

            const SizedBox(height: 24),

            // 📅 선택 카드
            InkWell(
              onTap: () => _pickDateTime(context),
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF1E6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Color(0xFFF4A261),
                        size: 26,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayDate,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          displayTime,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // 🚀 다음 버튼
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4A261),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  final dateString =
                  _selectedDateTime.toIso8601String();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StepSituationScreen(
                        history: widget.history,
                        onSavedOutfit: widget.onSavedOutfit,
                        weather: widget.initialWeather,
                        date: dateString,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "다음",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}