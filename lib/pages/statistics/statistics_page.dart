import 'package:flutter/material.dart';

import '../../global/banner/banner.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          BannerSection(imageUrl: 'assets/images/statistiques.png'),
          SizedBox(
            height: 31,
          ),
          Center(
            child: Text(
              'Statistiques',
              style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.w100,
                  fontFamily: 'MPLUSRounded1c'),
            ),
          ),
        ],
      ),
    );
  }
}
