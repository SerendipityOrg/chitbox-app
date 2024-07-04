import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/logos/NewChits_bottom_nav_icon.png',
            color: widget.currentIndex == 0 ? Colors.purple : Colors.grey,
            height: 24,
          ),
          label: 'New Chits',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/logos/MyChits_bottom_nav_icon.png',
            color: widget.currentIndex == 1 ? Colors.purple : Colors.grey,
            height: 24,
          ),
          label: 'My Chits',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/logos/Auction_bottom_nav_icon.png',
            color: widget.currentIndex == 2 ? Colors.purple : Colors.grey,
            height: 24,
          ),
          label: 'Auction',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/logos/Profile_bottom_nav_icon.png',
            color: widget.currentIndex == 3 ? Colors.purple : Colors.grey,
            height: 24,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
