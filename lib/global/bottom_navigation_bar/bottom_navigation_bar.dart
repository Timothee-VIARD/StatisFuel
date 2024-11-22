import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import 'widgets/button_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onIndexChanged;
  final int selectedIndex;

  const CustomNavigationBar({
    super.key,
    required this.onIndexChanged,
    required this.selectedIndex,
  });

  final List<Map<String, String>> navigationButtons = const [
    {'title': 'Nouveau'},
    {'title': 'Historique'},
    {'title': 'Statistiques'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 24),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: List.generate(
            navigationButtons.length * 2 - 1,
            (index) {
              if (index.isEven) {
                int buttonIndex = index ~/ 2;
                return ButtonNavBar(
                  isSelected: selectedIndex == buttonIndex,
                  title: navigationButtons[buttonIndex]['title']!,
                  buttonIndex: buttonIndex,
                  onIndexChanged: onIndexChanged,
                );
              } else {
                return const SizedBox(
                  height: 12,
                  child: VerticalDivider(
                    color: AppColors.onSecondaryLight,
                    thickness: 1,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}