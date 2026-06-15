class AppUser {
  final String name;
  final String email;
  final String profileImageUrl;
  final int wardrobeCount;
  final int recommendCount;
  final int savedOutfitCount;

  AppUser({
    required this.name,
    required this.email,
    this.profileImageUrl = '',
    this.wardrobeCount = 0,
    this.recommendCount = 0,
    this.savedOutfitCount = 0,
  });
}