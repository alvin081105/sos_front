import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signUp(BuildContext context) {
    if (_passwordController.text == _confirmPasswordController.text) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('회원가입 성공'),
          content: Text('회원가입이 완료되었습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('오류'),
          content: Text('비밀번호가 일치하지 않습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: '이름', border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: '이메일', border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: '비밀번호', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: '비밀번호 확인', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _signUp(context),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                    ),
                    child: Text('회원가입'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
