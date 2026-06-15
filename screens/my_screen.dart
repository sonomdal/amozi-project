import 'package:flutter/material.dart';
import 'account_info_screen.dart';
import 'help_screen.dart';
import 'login_screen.dart';

class MyScreen extends StatelessWidget {
  final int closetCount;
  final int historyCount;
  final int savedOutfitCount;

  const MyScreen({
    super.key,
    required this.closetCount,
    required this.historyCount,
    required this.savedOutfitCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 👤 프로필 카드
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFFF1E6),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 34,
                        color: Color(0xFFF4A261),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '아모지',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'amozi@example.com',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 📊 통계 카드
              Row(
                children: [
                  Expanded(child: _statBox("옷장", closetCount)),
                  const SizedBox(width: 10),
                  Expanded(child: _statBox("추천", historyCount)),
                  const SizedBox(width: 10),
                  Expanded(child: _statBox("저장", savedOutfitCount)),
                ],
              ),

              const SizedBox(height: 24),

              // 📋 메뉴
              _menuCard([
                _menuItem(
                  icon: Icons.account_circle_outlined,
                  label: '계정 정보',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AccountInfoScreen(),
                    ),
                  ),
                ),
                _divider(),
                _menuItem(
                  icon: Icons.help_outline,
                  label: '도움말',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HelpScreen()),
                  ),
                ),
                _divider(),
                _menuItem(
                  icon: Icons.logout,
                  label: '로그아웃',
                  isRed: true,
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (_) => false,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // 📊 통계 카드
  Widget _statBox(String label, int value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "$value",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 📋 메뉴 카드
  Widget _menuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFF2F2F2));
  }

  // 📋 메뉴 아이템
  Widget _menuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isRed = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Icon(icon,
                size: 22,
                color: isRed ? const Color(0xFFE76F51) : Colors.black54),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: isRed ? const Color(0xFFE76F51) : Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}