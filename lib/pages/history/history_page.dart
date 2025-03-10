import 'package:flutter/material.dart';

import '../../global/banner/banner.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          BannerSection(imageUrl: 'assets/images/historique.png'),
          SizedBox(
            height: 31,
          ),
          Center(
            child: Text(
              'Historique',
              style: TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
        ],
      ),
    );
  }
}
