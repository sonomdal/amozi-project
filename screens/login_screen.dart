import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_tab_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _pwCtrl = TextEditingController();
  bool _showError = false;

  Future<void> _login() async {
    if (_emailCtrl.text.isNotEmpty && _pwCtrl.text.length >= 8) {

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainTabScreen()),
      );

    } else {
      setState(() => _showError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.checkroom,
                  size: 64, color: Color(0xFFF4A261)),
              const Text('MOZI',
                  style: TextStyle(
                      color: Color(0xFFF4A261),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6)),
              const SizedBox(height: 48),

              _inputField(controller: _emailCtrl, hint: '이메일', hasError: _showError),
              const SizedBox(height: 12),
              _inputField(controller: _pwCtrl, hint: '비밀번호', obscure: true, hasError: _showError),

              if (_showError)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    '이메일 또는 비밀번호가 일치하지 않아요',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4A261),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                  ),
                  child: const Text('로그인',
                      style: TextStyle(color: Colors.white)),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('계정이 없으신가요? ',
                      style: TextStyle(color: Colors.black45)),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    ),
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                          color: Color(0xFFF4A261),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    bool hasError = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: hasError
              ? const BorderSide(color: Colors.red)
              : BorderSide.none,
        ),
      ),
    );
  }
}