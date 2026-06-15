import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/view_recommendation_result.dart';
import 'result_detail_screen.dart';
import '../services/ai_recommendation_service.dart';

class RecommendationResultScreen extends StatefulWidget {
  final List<ViewRecommendationResult> results;
  final Function(ViewRecommendationResult, bool) onSavedOutfit;
  final bool isAiMode;
  final double? temperature;
  final String? situation;
  final String? date;
  final String? bodyCondition; // 1. 여기서 변수 선언 추가

  const RecommendationResultScreen({
    super.key,
    required this.results,
    required this.onSavedOutfit,
    this.isAiMode = false,
    this.temperature,
    this.situation,
    this.date,
    this.bodyCondition, // 2. 생성자에서 받을 수 있게 함
  });

  @override
  State<RecommendationResultScreen> createState() => _RecommendationResultScreenState();
}

class _RecommendationResultScreenState extends State<RecommendationResultScreen> {
  bool isLoading = true;
  List<ViewRecommendationResult> displayResults = [];

  @override
  void initState() {
    super.initState();
    if (widget.isAiMode) {
      _fetchAiRecommendations();
    } else {
      displayResults = widget.results;
      isLoading = false;
    }
  }

  Future<void> _fetchAiRecommendations() async {
    final service = AIRecommendationService();
    try {
      final results = await service.requestAICoordi(
        weatherStatus: "맑음",
        temperature: widget.temperature ?? 24.0,
        situation: widget.situation ?? "일상",
        bodyCondition: widget.bodyCondition ?? "보통",
        items: [],
        date: widget.date ?? DateTime.now().toString(),
      );

      setState(() {
        displayResults = results;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("AI 에러: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E8), // 크림색 배경
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF3E8),
        elevation: 0,
        title: Text(widget.isAiMode ? "AI가 제안하는 코디" : "코디 추천 결과",
            style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFFF4A261)))
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: displayResults.length,
        itemBuilder: (context, index) {
          final item = displayResults[index];
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ResultDetailScreen(result: item, index: index))),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  Container(
                    height: 260,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                    child: item.synthesizedImageUrl.isNotEmpty
                        ? ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.network(item.synthesizedImageUrl, fit: BoxFit.cover))
                        : const Icon(Icons.checkroom, size: 80, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("AI 추천 코디", style: TextStyle(color: Colors.black87)),
                        IconButton(
                          icon: Icon(item.isSaved ? Icons.favorite : Icons.favorite_border,
                              color: item.isSaved ? const Color(0xFFF4A261) : Colors.grey),
                          onPressed: () {
                            setState(() => item.isSaved = !item.isSaved);
                            widget.onSavedOutfit(item, item.isSaved);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}