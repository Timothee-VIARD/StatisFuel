import 'package:flutter/material.dart';
import 'package:statisfuel/i18n/strings.g.dart';

import 'widgets/button_nav_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onIndexChanged;
  final int selectedIndex;

  CustomNavigationBar({
    super.key,
    required this.onIndexChanged,
    required this.selectedIndex,
  });

  final List<Map<String, String>> navigationButtons = [
    {'title': t.dashboard.title},
    {'title': t.statistics.title},
    {'title': t.history.title},
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration:  BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
              return  SizedBox(
                height: 12,
                child: VerticalDivider(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                  thickness: 1,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
