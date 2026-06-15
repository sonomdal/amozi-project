import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/recommendation_history.dart';
import 'models/view_recommendation_result.dart';
import 'models/wardrobe_item.dart';

import 'screens/home_screen.dart';
import 'screens/closet_screen.dart';
import 'screens/history_screen.dart';
import 'screens/my_screen.dart';
import 'screens/main_tab_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Smart Closet',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],

      theme: ThemeData(
        primaryColor: const Color(0xFFF4A261),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Pretendard',
      ),

      home: const SplashScreen(),
    );
  }
}

//
// 🟠 SPLASH SCREEN (FIXED)
//
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!mounted) return;

    Widget next;

    if (isLoggedIn) {
      next = const MainTabScreen();
    } else {
      next = const LoginScreen();
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => next),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4A261),
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//
// 🟢 MAIN TAB SCREEN (FIXED STRUCTURE)
//
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  final RecommendationHistory history = RecommendationHistory();
  final List<WardrobeItem> closetItems = [];
  final List<ViewRecommendationResult> _savedOutfits = [];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(
        history: history,
        onSavedOutfit: (result, isSaved) {
          setState(() {
            if (isSaved) {
              if (!_savedOutfits.any((e) => e.resultId == result.resultId)) {
                _savedOutfits.add(result);
              }
            } else {
              _savedOutfits.removeWhere((e) => e.resultId == result.resultId);
            }
          });
        },
      ),

      ClosetScreen(
        items: closetItems,
        onUpdate: () => setState(() {}),
      ),

      HistoryScreen(history: history),

      MyScreen(
        closetCount: closetItems.length,
        historyCount: history.count,
        savedOutfitCount: _savedOutfits.length,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF4A261),
        unselectedItemColor: Colors.grey,
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
    );
  }
}