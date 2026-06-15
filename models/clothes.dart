// 💡 1. 유저님의 파일 이름 규칙을 100% 활용하는 옷 데이터 규격 정의
class ClothesItem {
  final String id;
  final String name;
  final String category;
  final String imagePath;

  // 기온 속성은 파일 이름을 기반으로 자동 계산되도록 getter로 처리합니다.
  double get minTemp {
    if (imagePath.contains('summer')) return 23.0;
    if (imagePath.contains('winter')) return -20.0;
    if (imagePath.contains('spring') || imagePath.contains('autumn')) return 12.0;
    return -20.0; // 'all' (사계절용)은 최저 기온 제한 없음
  }

  double get maxTemp {
    if (imagePath.contains('summer')) return 40.0;
    if (imagePath.contains('winter')) return 11.0;
    if (imagePath.contains('spring') || imagePath.contains('autumn')) return 22.0;
    return 40.0; // 'all' (사계절용)은 최고 기온 제한 없음
  }

  ClothesItem({
    required this.id,
    required this.name,
    required this.category,
    required this.imagePath,
  });
}

// ... WeatherScreenState 클래스 내부 내부 ...
final List<ClothesItem> _allClothes = [
  // 상의 (Top)
  ClothesItem(id: 'top1', name: '', category: '흰색 블라우스', imagePath: 'assets/clothes/top1_blouse_spring.png'),
  ClothesItem(id: 'top2', name: '분홍색 반팔 블라우스', category: 'top', imagePath: 'assets/clothes/top2_blouse_summer.png'), // 사계절용 셔츠는all
  ClothesItem(id: 'top3', name: '남색 반팔 블라우스', category: 'top', imagePath: 'assets/clothes/top3_blouse_summer.png'),
  ClothesItem(id: 'top4', name: '남색 원피스', category: 'top', imagePath: 'assets/clothes/top4_dress_spring.png'),
  ClothesItem(id: 'top5', name: '민트색 니트', category: 'top', imagePath: 'top5_knit_winter.png'),
  ClothesItem(id: 'top6', name: '검은색 반팔 티', category: 'top', imagePath: 'top6_tshirts_summer.jpg'),
  ClothesItem(id: 'top7', name: '베이지색 반팔 티', category: 'top', imagePath: 'top7_tshirts_summer.png'),
  ClothesItem(id: 'top8', name: '흰색 반팔 티', category: 'top', imagePath: 'top8_tshirts_summer.png'),

  // 하의 (Bottom)
  ClothesItem(id: 'bottom1', name: '미니 데님 스커트', category: 'bottom', imagePath: 'assets/clothes/bottom1_denimskirt_spring.png'),
  ClothesItem(id: 'bottom2', name: '중청 부츠컷 청바지', category: 'bottom', imagePath: 'assets/clothes/bottom2_jean_spring.png'),
  ClothesItem(id: 'bottom3', name: '검은색 롱치마', category: 'bottom', imagePath: 'assets/clothes/bottom3_longskirt_spring.png'),
  ClothesItem(id: 'bottom4', name: '흰색 롱치마', category: 'bottom', imagePath: 'assets/clothes/bottom4_longskirt_summer.png'),
  ClothesItem(id: 'bottom5', name: '흰색 반바지', category: 'bottom', imagePath: 'assets/clothes/bottom5_shortpants_summer.png'),
  ClothesItem(id: 'bottom6', name: '검은색 편한 반바지', category: 'bottom', imagePath: 'assets/clothes/bottom6_shortpants_summer.png'),
  ClothesItem(id: 'bottom7', name: '검은색 미니 스커트', category: 'bottom', imagePath: 'assets/clothes/bottom7_skirt_summer.png'),
  ClothesItem(id: 'bottom8', name: '회색 슬랙스', category: 'bottom', imagePath: 'assets/clothes/bottom8_slacks_spring.png'),
  ClothesItem(id: 'bottom9', name: '회색 트레이닝 팬츠', category: 'bottom', imagePath: 'assets/clothes/bottom9_training_spring.png'),

  // 아우터 (Outer)
  ClothesItem(id: 'outer1', name: '회색 롱 코트', category: 'outer', imagePath: 'assets/clothes/outer1_coat_winter.png'),
  ClothesItem(id: 'outer2', name: '검은색 가죽 자켓', category: 'outer', imagePath: 'assets/clothes/outer2_leather_autumn.png'),
  ClothesItem(id: 'outer3', name: '검은색 숏패딩', category: 'outer', imagePath: 'assets/clothes/outer3_padding_winter.png'),
  ClothesItem(id: 'outer4', name: '파란색 체크셔츠', category: 'outer', imagePath: 'assets/clothes/outer4_shirts_spring.png'),
  ClothesItem(id: 'outer5', name: '하늘색 바람막이', category: 'outer', imagePath: 'assets/clothes/outer5_windbreak_spring.png'),
  ClothesItem(id: 'outer6', name: '남색 후드집업', category: 'outer', imagePath: 'assets/clothes/outer6_hood_spring.png'),

  // 신발 (Shoes)
  ClothesItem(id: 'shoes1', name: '검은색 롱부츠', category: 'shoes', imagePath: 'assets/clothes/shoes1_boots_spring.png'),
  ClothesItem(id: 'shoes2', name: '흰색 리본 플랫슈즈', category: 'shoes', imagePath: 'assets/clothes/shoes2_flats_spring.png'),
  ClothesItem(id: 'shoes3', name: '검은색 로퍼', category: 'shoes', imagePath: 'assets/clothes/shoes3_loafers_all.png'),
  ClothesItem(id: 'shoes4', name: '검은색 구두', category: 'shoes', imagePath: 'assets/clothes/shoes4_heel_summer.png'),
  ClothesItem(id: 'shoes5', name: '흰색 미디 레인부츠', category: 'shoes', imagePath: 'assets/clothes/shoes5_rainboots_summer.png'),
  ClothesItem(id: 'shoes6', name: '흰색 운동화', category: 'shoes', imagePath: 'assets/clothes/shoes6_sneakers_all.png'),

  // 가방 (Bag)
  ClothesItem(id: 'bag1', name: '연한 회색 백팩', category: 'shoes', imagePath: 'assets/clothes/bag1_backpack_all.png'),
  ClothesItem(id: 'bag2', name: '갈색 숄더백', category: 'shoes', imagePath: 'assets/clothes/bag2_shoulderbag_all.png'),
  ClothesItem(id: 'bag3', name: '연두색 토트백', category: 'shoes', imagePath: 'assets/clothes/bag3_totebag_all.png'),
];