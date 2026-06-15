class ViewRecommendationResult {
  final String resultId;
  final String recommendText;
  final String styleTitle;       // 예: "캐주얼 데이트룩"
  final List<String> tags;       // 예: ["니트", "슬랙스", "로퍼"]
  final List<Map<String, String>> recommendedCombinations;
  final String synthesizedImageUrl;
  final String date;             // 예: "6월 13일 (토)"
  final double temperature;
  final String weatherStatus;
  bool isSaved;

  ViewRecommendationResult({
    required this.resultId,
    required this.recommendText,
    this.styleTitle = '',
    this.tags = const [],
    required this.recommendedCombinations,
    required this.synthesizedImageUrl,
    this.date = '',
    this.temperature = 0,
    this.weatherStatus = '',
    this.isSaved = false,
  });
}