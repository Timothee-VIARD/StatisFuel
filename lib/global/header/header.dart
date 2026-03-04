import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 33.5,
            backgroundColor: Colors.transparent,
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
