import 'package:flutter/material.dart';

class DangerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('긴급 상황'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          '긴급 상황 발생!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
