import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 33.5,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          SizedBox(width: 16),
          Text(
            'StatisFuel',
            style: TextStyle(fontSize: 24, fontFamily: 'Roboto Slab'),
          ),
        ],
      ),
    );
  }
}
