import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _pwCtrl = TextEditingController();
  final _pwConfirmCtrl = TextEditingController();

  // 유효성 상태
  bool? _emailValid;
  bool? _pwValid;
  bool? _pwMatch;
  bool _emailDuplicate = false;

  void _validateEmail(String v) {
    setState(() {
      _emailDuplicate = v == 'amozi@example.com'; // 더미 중복 체크
      _emailValid = v.contains('@') && !_emailDuplicate;
    });
  }

  void _validatePw(String v) {
    setState(() {
      _pwValid = v.length >= 8 && v.contains(RegExp(r'[a-zA-Z]')) && v.contains(RegExp(r'[0-9]'));
      _pwMatch = _pwConfirmCtrl.text == v;
    });
  }

  void _validatePwConfirm(String v) {
    setState(() => _pwMatch = v == _pwCtrl.text);
  }

  void _register() {
    if (_emailValid == true && _pwValid == true && _pwMatch == true &&
        _nameCtrl.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: const Text('회원가입이 완료되었어요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text('로그인하기',
                  style: TextStyle(color: Color(0xFFF4A261))),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('회원가입',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          children: [
            const Icon(Icons.checkroom, size: 56, color: Color(0xFFF4A261)),
            const Text('MOZI',
                style: TextStyle(color: Color(0xFFF4A261), fontSize: 16,
                    fontWeight: FontWeight.bold, letterSpacing: 4)),
            const SizedBox(height: 32),

            _buildField(label: '이름', controller: _nameCtrl, hint: '이름을 입력하세요'),
            const SizedBox(height: 16),
            _buildField(
              label: '이메일', controller: _emailCtrl, hint: '이메일을 입력하세요',
              onChanged: _validateEmail,
              isValid: _emailValid,
              errorText: _emailDuplicate ? '이미 사용 중인 이메일이에요' : null,
              validText: '사용 가능한 이메일이에요',
            ),
            const SizedBox(height: 16),
            _buildField(
              label: '비밀번호', controller: _pwCtrl, hint: '비밀번호를 입력하세요',
              obscure: true, onChanged: _validatePw,
              isValid: _pwValid,
              validText: '영문, 숫자 포함 8자 이상',
              errorText: '영문, 숫자 포함 8자 이상',
            ),
            const SizedBox(height: 16),
            _buildField(
              label: '비밀번호 확인', controller: _pwConfirmCtrl,
              hint: '비밀번호를 다시 입력하세요', obscure: true,
              onChanged: _validatePwConfirm, isValid: _pwMatch,
              validText: '비밀번호가 일치해요',
              errorText: '비밀번호가 일치하지 않아요',
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF4A261),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: const Text('회원가입',
                    style: TextStyle(color: Colors.white, fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Function(String)? onChanged,
    bool? isValid,
    String? validText,
    String? errorText,
  }) {
    Color borderColor = const Color(0xFFEEEEEE);
    if (isValid == true) borderColor = Colors.green;
    if (isValid == false) borderColor = Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        if (isValid == true && validText != null) ...[
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 13),
            const SizedBox(width: 4),
            Text(validText, style: const TextStyle(color: Colors.green, fontSize: 12)),
          ]),
        ],
        if (isValid == false && errorText != null) ...[
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 13),
            const SizedBox(width: 4),
            Text(errorText, style: const TextStyle(color: Colors.red, fontSize: 12)),
          ]),
        ],
      ],
    );
  }
}