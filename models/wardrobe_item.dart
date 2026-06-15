class WardrobeItem {
  final String id;
  final String name;
  final String category; // 상의, 하의, 아우터, 신발, 잡화
  final String imageUrl;

  WardrobeItem({
    required this.id,
    required this.name,
    required this.category,
    this.imageUrl = '',
  });
}