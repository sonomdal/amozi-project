import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'closet_screen.dart';
import 'history_screen.dart';
import 'my_screen.dart';
import '../models/recommendation_history.dart';
import '../models/wardrobe_item.dart';
import '../models/view_recommendation_result.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  final RecommendationHistory _history = RecommendationHistory();
  final List<WardrobeItem> _closetItems = [];
  final List<ViewRecommendationResult> _savedOutfits = [];

  void _updateCloset() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeScreen(
        history: _history,
        onSavedOutfit: (result, isSaved) {
          setState(() {
            if (isSaved) {
              if (!_savedOutfits.any(
                      (o) => o.resultId == result.resultId)) {
                _savedOutfits.add(result);
              }
            } else {
              _savedOutfits.removeWhere(
                      (o) => o.resultId == result.resultId);
            }
          });
        },
      ),

      ClosetScreen(
        items: _closetItems,
        onUpdate: _updateCloset,
      ),

      HistoryScreen(history: _history),

      MyScreen(
        closetCount: _closetItems.length,
        historyCount: _history.count,
        savedOutfitCount: _savedOutfits.length,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),

      // 🔥 커스텀 BottomNavigationBar (훨씬 앱 느낌)
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),

          type: BottomNavigationBarType.fixed,
          elevation: 0,

          selectedItemColor: const Color(0xFFF4A261),
          unselectedItemColor: Colors.black38,

          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),

          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checkroom_outlined),
              activeIcon: Icon(Icons.checkroom),
              label: '옷장',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              activeIcon: Icon(Icons.history),
              label: '기록',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: '마이',
            ),
          ],
        ),
      ),
    );
  }
}