import 'package:flutter/material.dart';
import 'dart:async'; // Timer 클래스를 사용하기 위해 추가
import 'mypage.dart';
import 'settings_page.dart';
import 'danger_page.dart'; // 위험 상황 발생 페이지

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isImpactDetected = false; // 충격 감지 여부
  int _countdown = 10; // 카운트다운 시간
  late Timer _timer;

  // 각 탭에 연결된 화면들
  final List<Widget> _pages = <Widget>[
    Center(child: Text('홈 화면', style: TextStyle(fontSize: 24))),
    MyPage(), // 마이페이지 화면
    SettingsPage(), // 설정 화면
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _startImpactDetection() {
    setState(() {
      _isImpactDetected = true;
      _countdown = 10; // 카운트다운 초기화
    });

    // 1초마다 카운트다운 감소
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
        _triggerDangerPage();
      }
    });
  }

  void _cancelImpactDetection() {
    setState(() {
      _isImpactDetected = false;
      _countdown = 10; // 초기화
    });
    _timer.cancel();
  }

  void _triggerDangerPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DangerPage()),
    ).then((_) {
      // 위험 상황 페이지에서 돌아오면 충격 상태 초기화
      _cancelImpactDetection();
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ['홈', '마이페이지', '설정'][_selectedIndex], // 페이지 제목
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _isImpactDetected
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '충격이 감지되었습니다!',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text(
              '남은 시간: $_countdown초',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cancelImpactDetection,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('안전 확인'),
            ),
          ],
        ),
      )
          : _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: _startImpactDetection,
        backgroundColor: Colors.red,
        child: Icon(Icons.warning),
        tooltip: '충격 감지 시작',
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
