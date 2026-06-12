import 'package:flutter/material.dart';
import 'package:klaverjasapp/screens/EnterNamesScreen.dart';
import 'package:klaverjasapp/screens/TabItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<TabItem> tabs = [
    TabItem(page: EnterNameScreen(), icon: Icons.home, label: 'Home'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: EnterNameScreen());
  }
}
