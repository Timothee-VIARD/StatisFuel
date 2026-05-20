import 'package:flutter/material.dart';
import 'package:statisfuel/theme/app_config.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: AppConfig.spacing * 2,
      children: [
        CircleAvatar(
          radius: 33.5,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        Text(
          'StatisFuel',
          style: TextStyle(fontSize: 24, fontFamily: 'Roboto Slab'),
        ),
      ],
    );
  }
}
