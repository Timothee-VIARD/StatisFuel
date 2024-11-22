import 'package:flutter/material.dart';

import '../../global/banner/banner.dart';
import '../../style/app_colors.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const BannerSection(imageUrl: 'assets/images/plein.png'),
          const SizedBox(height: 31),
          const Center(
            child: Text(
              'Nouvelle consommation',
              style: TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 34),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border, width: 1),
              ),
              child: Text("data")
            ),
          ),
        ],
      ),
    );
  }
}
