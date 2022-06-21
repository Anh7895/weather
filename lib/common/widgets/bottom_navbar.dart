import 'package:flutter/material.dart';
import 'package:weather/ui/home/home_screen.dart';

class BottomNavBarApp extends StatefulWidget {
  createState() => _BottomNavBarAppState();
}

class _BottomNavBarAppState extends State<BottomNavBarApp> {
  int? currentTab = 1;
  String? currentTitle = 'Home';
  Widget? currentPage;

  @override
  void initState() {
    currentPage = HomeScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectTab(int tabItem) {
    setState(() {
      currentTab = tabItem;
      switch (tabItem) {
        case 1:
          currentTitle = 'Home';
          currentPage = HomeScreen();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            children: [
              HomeScreen(),
            ],
            index: currentTab,
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.blueAccent,
            currentIndex: currentTab!,
            onTap: (int i){
              _selectTab(i);
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Notifications',
                icon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                label: 'Image',
                icon: Icon(Icons.settings),
              ),
            ],
          )
      ),
    );
  }
}
