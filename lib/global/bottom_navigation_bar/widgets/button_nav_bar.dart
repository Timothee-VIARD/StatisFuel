import 'package:flutter/material.dart';

import '../../widget.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    super.key,
    required this.isSelected,
    required this.title,
    required this.buttonIndex,
    required this.onIndexChanged,
  });

  final bool isSelected;

  final String title;
  final int buttonIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        height: 38,
        decoration: isSelected
            ? BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              )
            : null,
        child: TVButton(
          onPressed: () => onIndexChanged(buttonIndex),
          backgroundColor: isSelected ? null : Colors.transparent,
          overlayColor: Colors.transparent,
          shadowBlurRadius: 2,
          shadowSpreadRadius: 1,
          shadowColor: isSelected
              ? colorScheme.primary.withValues(alpha: 0.12)
              : Colors.transparent,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.65),
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
