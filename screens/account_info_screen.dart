import 'package:flutter/material.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final _nameCtrl = TextEditingController(text: '아모지');
  final _emailCtrl = TextEditingController(text: 'amozi@example.com');
  final _currentPwCtrl = TextEditingController();
  final _newPwCtrl = TextEditingController();

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('변경사항이 저장되었어요!'),
          backgroundColor: Color(0xFFF4A261)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('계정 정보',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 프로필 사진
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 88, height: 88,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFEEFDE), shape: BoxShape.circle),
                  child: const Icon(Icons.person, size: 48, color: Color(0xFFF4A261)),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('프로필 사진 변경',
                    style: TextStyle(color: Color(0xFFF4A261), fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 24),

            _field(label: '이름', controller: _nameCtrl),
            const SizedBox(height: 16),
            _field(label: '이메일', controller: _emailCtrl),
            const SizedBox(height: 16),
            _field(label: '현재 비밀번호', controller: _currentPwCtrl,
                hint: '변경 시에만 입력', obscure: true),
            const SizedBox(height: 16),
            _field(label: '새 비밀번호', controller: _newPwCtrl,
                hint: '변경 시에만 입력', obscure: true),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4A261),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: const Text('변경사항 저장',
                    style: TextStyle(color: Colors.white, fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field({required String label, required TextEditingController controller,
    String? hint, bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFF4A261))),
          ),
        ),
      ],
    );
  }
}