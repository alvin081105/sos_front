import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String userName = "User_name"; // 사용자 이름
  final int age = 20; // 나이
  final String sex = "M"; // 성별
  final String personalInfoStatus = "Done"; // 개인 정보 상태
  final String address = "서울특별시 관악구 봉천로 14"; // 주소

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Age: $age / Sex: $sex',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Personal Information: $personalInfoStatus',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),
            Text(
              'Address: $address',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.blue),
              title: Text('프로필 편집'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('로그아웃'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
