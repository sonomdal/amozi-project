import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '도움말',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              '자주 묻는 질문',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  _buildFaq(
                    '코디 추천은 어떻게 이루어지나요?',
                    '현재 위치 기반 날씨 + 사용자의 상황 + 컨디션을 분석하여 AI가 최적의 코디를 추천합니다.',
                  ),

                  _buildFaq(
                    '옷장 아이템은 몇 개까지 등록 가능한가요?',
                    '기본적으로 최대 100개까지 등록 및 관리할 수 있습니다.',
                  ),

                  _buildFaq(
                    '추천 결과가 마음에 들지 않으면?',
                    '다시 추천받기 기능을 통해 조건을 변경하여 새로운 코디를 받을 수 있습니다.',
                  ),

                  _buildFaq(
                    '계정 정보는 어디서 수정하나요?',
                    '마이페이지 > 계정 정보 메뉴에서 닉네임, 이메일 등을 수정할 수 있습니다.',
                  ),

                  const SizedBox(height: 24),

                  // 📩 문의 버튼
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(14),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: Color(0xFFF4A261),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '1:1 문의하기',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 📦 FAQ 카드 (정돈된 스타일)
  Widget _buildFaq(String title, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          childrenPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 14,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          iconColor: Colors.black54,
          collapsedIconColor: Colors.black38,
          children: [
            Text(
              answer,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}