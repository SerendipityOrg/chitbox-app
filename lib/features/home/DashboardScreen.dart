import 'package:chitbox_app/features/home/AuctionScreen.dart';
import 'package:chitbox_app/features/home/MyChitsScreen.dart';
import 'package:chitbox_app/features/home/NewChitsScreen.dart';
import 'package:chitbox_app/features/home/ProfileScreen.dart';
import 'package:chitbox_app/navigation_menu.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    NewChitsScreen(),
    MyChitsScreen(),
    AuctionScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
