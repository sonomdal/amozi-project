import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../models/view_recommendation_result.dart';

class AIRecommendationService {
  late final GenerativeModel _model;

  AIRecommendationService() {
    final apiKey = dotenv.env['GEMINI_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("GEMINI_API_KEY가 설정되지 않았습니다.");
    }

    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
  }

  Future<List<ViewRecommendationResult>> requestAICoordi({
    required String weatherStatus,
    required double temperature,
    required String situation,
    required String bodyCondition,
    required List<dynamic> items,
    required String date,
  }) async {
    try {
      final prompt = _buildPrompt(
        weatherStatus,
        temperature,
        situation,
        bodyCondition,
        date,
      );

      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      final rawText = response.text;

      if (rawText == null || rawText.isEmpty) {
        throw Exception("AI 응답이 비어있습니다.");
      }

      final data = _parseJsonSafely(rawText);

      final result = ViewRecommendationResult(
        resultId: "ai_${DateTime.now().millisecondsSinceEpoch}",
        recommendText: data['advice'] ?? "추천 스타일입니다.",
        styleTitle: "$situation을 위한 코디",
        recommendedCombinations: [],
        synthesizedImageUrl: _buildImageUrl(data['imagePrompt']),
        date: date,
        temperature: temperature,
        weatherStatus: weatherStatus,
        tags: [situation, bodyCondition],
        isSaved: false,
      );

      return [result];
    } catch (e) {
      print("AI 서비스 에러: $e");
      return [];
    }
  }

  // 🔧 프롬프트 분리
  String _buildPrompt(
      String weatherStatus,
      double temperature,
      String situation,
      String bodyCondition,
      String date,
      ) {
    return '''
너는 한국 2030 여성 대상 전문 패션 스타일리스트야.

[사용자 정보]
- 날짜: $date
- 날씨: $weatherStatus (${temperature}도)
- 상황: $situation
- 컨디션: $bodyCondition

[출력 규칙]
- 반드시 JSON만 출력
- 설명 금지
- 아래 형식 고정

{
  "advice": "스타일 추천 문장",
  "imagePrompt": "Korean fashion, 구체적인 코디 설명"
}
''';
  }

  // 🧨 JSON 안정 파서 (핵심)
  Map<String, dynamic> _parseJsonSafely(String text) {
    try {
      // 코드블럭 제거
      String cleaned = text
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      // JSON 범위만 추출
      final start = cleaned.indexOf('{');
      final end = cleaned.lastIndexOf('}');

      if (start == -1 || end == -1) {
        throw Exception("JSON 구조 없음");
      }

      final jsonString = cleaned.substring(start, end + 1);

      return jsonDecode(jsonString);
    } catch (e) {
      print("JSON 파싱 실패: $e");
      print("원본: $text");
      return {
        "advice": "오늘 날씨에 맞는 스타일을 추천할 수 없어요.",
        "imagePrompt": "Korean fashion simple outfit",
      };
    }
  }

  // 🖼 이미지 URL 생성 분리
  String _buildImageUrl(String? prompt) {
    final safePrompt = prompt ?? "Korean fashion outfit";

    return "https://pollinations.ai/p/${Uri.encodeComponent(safePrompt)}"
        "?width=512&height=512&nologo=true&seed=42";
  }
}