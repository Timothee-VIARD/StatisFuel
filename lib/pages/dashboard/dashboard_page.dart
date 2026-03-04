import 'package:flutter/material.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/new_consumption_dialog.dart';

import '../../global/banner/banner.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const BannerSection(imageUrl: 'assets/images/plein.png'),
          const SizedBox(height: 31),
          Center(
            child: Text(
              t.dashboard.title,
              style:
                  const TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Spacer(),

          ElevatedButton(
            onPressed: () => buildItemCreation(context),
            child: const Text('Ajouter une consommation'),
          ),
        ],
      ),
    );
  }
}
