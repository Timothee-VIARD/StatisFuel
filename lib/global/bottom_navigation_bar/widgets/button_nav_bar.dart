import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar(
      {super.key,
        required this.isSelected,
        required this.title,
        required this.buttonIndex,
        required this.onIndexChanged,});

  final bool isSelected;

  final String title;
  final int buttonIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 38,
        decoration: isSelected
            ? BoxDecoration(
            color: AppColors.surface,
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],)
            : null,
        child: TextButton(
          onPressed: () => onIndexChanged(buttonIndex),
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? AppColors.onSecondary
                  : AppColors.onSecondaryLight,
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
