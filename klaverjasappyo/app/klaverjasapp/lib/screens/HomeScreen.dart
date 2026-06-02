import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/EnterNamesScreen.dart';
import 'package:klaverjasapp/screens/TabItem.dart';
import 'package:klaverjasapp/state/GameState.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<TabItem> tabs = [
    TabItem(
      page: ChangeNotifierProvider(
        create: (context) => GameState(),
        child: EnterNameScreen(),
      ),
      icon: Icons.home,
      label: 'Home',
    ),
    TabItem(
      page: Center(child: Text('Favorites')),
      icon: Icons.favorite,
      label: 'Favorites',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
