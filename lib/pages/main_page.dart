import 'package:flutter/material.dart';

import '../global/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../global/header/header.dart';
import '../style/app_colors.dart';
import 'history/history_page.dart';
import 'new/new_page.dart';
import 'statistics/statistics_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (!_pageController.hasClients) return;

    final int newIndex = _pageController.page!.round();
    if (_selectedIndex != newIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
  }

  void _onIndexChanged(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 24),
        child: Column(
          children: [
            const HeaderSection(),
            const SizedBox(height: 31),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                children: const [
                  SchedulePage(),
                  ConnexionsPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        onIndexChanged: _onIndexChanged,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }
}