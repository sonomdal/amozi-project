import 'package:flutter/foundation.dart';
import 'view_recommendation_result.dart';

class RecommendationHistory {
  final List<ViewRecommendationResult> _history = [];
  static const int _maxCount = 10;

  void add(ViewRecommendationResult result) {
    _history.insert(0, result);
    if (_history.length > _maxCount) _history.removeLast();
    debugPrint('📋 히스토리 추가: ${result.resultId} (${_history.length}개)');
  }

  List<ViewRecommendationResult> getAll() => List.unmodifiable(_history);

  void clear() {
    _history.clear();
    debugPrint('🗑️ 히스토리 전체 삭제');
  }

  int get count => _history.length;
}