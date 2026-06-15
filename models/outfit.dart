// lib/models/outfit.dart
import 'wardrobe_item.dart';

class Outfit {
  final String id;
  final String name; // 예: "오늘의 데일리룩"
  final List<WardrobeItem> items; // AI가 선택한 아이템들
  final String description; // AI의 코디 추천 이유
  final DateTime savedAt;

  Outfit({
    required this.id,
    required this.name,
    required this.items,
    required this.description,
  }) : savedAt = DateTime.now();
}