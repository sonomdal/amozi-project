import 'package:flutter/material.dart';
import '../models/view_recommendation_result.dart';

class ResultDetailScreen extends StatefulWidget {
  final ViewRecommendationResult result;
  final int index;

  const ResultDetailScreen({super.key, required this.result, required this.index});

  @override
  State<ResultDetailScreen> createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final r = widget.result;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E8), // 디자인 가이드: 크림색 배경 적용
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF3E8), // 디자인 가이드: 배경색 일치
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('코디 상세',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 코디 사진 (기록-누를시.png 참조)
            Container(
              height: 320, // 사진 영역 높이 확보
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0), // 부드러운 회색
                borderRadius: BorderRadius.circular(20),
              ),
              child: r.synthesizedImageUrl.isNotEmpty
                  ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(r.synthesizedImageUrl, fit: BoxFit.cover))
                  : const Center(
                  child: Text('코디 사진', style: TextStyle(color: Colors.black38, fontSize: 18))),
            ),
            const SizedBox(height: 24),

            // 제목 + 코디 번호
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(r.styleTitle.isNotEmpty ? r.styleTitle : '추천 코디 ${widget.index + 1}',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6), // 디자인 포인트
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFF4A261)),
                  ),
                  child: Text('코디 ${widget.index + 1}',
                      style: const TextStyle(color: Color(0xFFF4A261), fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 추천 설명
            Text(r.recommendText,
                style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.6)),
            const SizedBox(height: 24),

            // 태그
            Wrap(
              spacing: 10, runSpacing: 10,
              children: r.tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white, // 태그 배경은 깔끔하게 흰색
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFF4A261).withOpacity(0.5)),
                ),
                child: Text(tag,
                    style: const TextStyle(color: Color(0xFFF4A261), fontSize: 14)),
              )).toList(),
            ),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFFD7CCC8)),
            const SizedBox(height: 20),

            // 별점 (기록-누를시.png의 흐름 유지)
            const Center(
              child: Text('이 코디 어땠나요?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text('별점을 남겨주시면 다음 추천에 반영돼요',
                  style: TextStyle(color: Colors.black45, fontSize: 12)),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) => IconButton(
                icon: Icon(
                  i < _rating ? Icons.star_rounded : Icons.star_border_rounded,
                  color: const Color(0xFFF4A261), size: 40,
                ),
                onPressed: () {
                  setState(() => _rating = i + 1);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$_rating점 피드백이 반영됐어요!'),
                      duration: const Duration(seconds: 1),
                      backgroundColor: const Color(0xFFF4A261),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}