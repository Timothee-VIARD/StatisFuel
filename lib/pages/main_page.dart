import 'package:flutter/material.dart';

import '../global/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../global/header/header.dart';
import '../style/app_colors.dart';
import 'history/history_page.dart';
import 'newEntry/new_entry_page.dart';
import 'statistics/statistics_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    if (!_pageController.hasClients || _isKeyboardVisible) return;

    FocusScope.of(context).unfocus();

    final int newIndex = _pageController.page!.round();
    if (_selectedIndex != newIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
  }

  void _onIndexChanged(int index) {
    if (_selectedIndex == index || _isKeyboardVisible) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _selectedIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  void _keyboardVisibilityListener() {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardVisible != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = isKeyboardVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisibilityListener();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.surface,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24),
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom - 24,
        child: Column(
          children: [
            const HeaderSection(),
            const SizedBox(height: 31),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: _isKeyboardVisible
                    ? const NeverScrollableScrollPhysics()
                    : const ClampingScrollPhysics(),
                children: const [
                  NewEntryPage(),
                  HistoryPage(),
                  StatisticsPage(),
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
