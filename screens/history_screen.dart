import 'package:flutter/material.dart';
import '../models/recommendation_history.dart';
import '../models/view_recommendation_result.dart';
import 'result_detail_screen.dart';

class HistoryScreen extends StatelessWidget {
  final RecommendationHistory history;

  const HistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final List<ViewRecommendationResult> items = history.getAll();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: const Text(
          '추천 기록',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: items.isEmpty
            ? const Center(
          child: Text(
            '아직 코디 추천 기록이 없습니다.\n첫 추천을 받아보세요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        )
            : ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];

            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultDetailScreen(
                    result: item,
                    index: index,
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 🖼 썸네일
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1E6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.checkroom,
                        color: Color(0xFFF4A261),
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 14),

                    // 📄 정보 영역
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 상단 정보 (날짜 + 날씨)
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.date.isNotEmpty
                                    ? item.date.split("T").first
                                    : '날짜 없음',
                                style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${item.temperature.toStringAsFixed(0)}° · ${item.weatherStatus}',
                                style: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // 제목
                          Text(
                            item.styleTitle.isNotEmpty
                                ? item.styleTitle
                                : '추천 코디 ${index + 1}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            "터치해서 자세히 보기",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.chevron_right,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}