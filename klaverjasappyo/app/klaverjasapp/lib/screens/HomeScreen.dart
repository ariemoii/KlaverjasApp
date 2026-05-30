import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/ScoreScreen.dart';
import 'package:klaverjasapp/screens/TabItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<TabItem> tabs = [
    TabItem(page: ScoreScreen(), icon: Icons.home, label: 'Home'),
    TabItem(
      page: Center(child: Text('Favorites')),
      icon: Icons.favorite,
      label: 'Favorites',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 👇 keeps state of each tab (VERY important)
      body: IndexedStack(
        index: selectedIndex,
        children: tabs.map((t) => t.page).toList(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: tabs
            .map(
              (t) =>
                  BottomNavigationBarItem(icon: Icon(t.icon), label: t.label),
            )
            .toList(),
      ),
    );
  }
}
