import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/EnterNamesScreen.dart';
import 'package:klaverjasapp/screens/TabItem.dart';
import 'package:klaverjasapp/screens/Test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<TabItem> tabs = [
    TabItem(page: EnterNameScreen(), icon: Icons.home, label: 'Home'),
    TabItem(page: Test(), icon: Icons.favorite, label: 'Test'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex].page,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: tabs.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.icon),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
