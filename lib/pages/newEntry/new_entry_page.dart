import 'package:flutter/material.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/newEntry/entry_form.dart';

import '../../global/banner/banner.dart';
import '../../style/app_colors.dart';

class NewEntryPage extends StatelessWidget {
  const NewEntryPage({super.key});

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
              t.consumption.newConsumption,
              style:
                  const TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: const SingleChildScrollView(child: EntryForm()),),
          ),
        ],
      ),
    );
  }
}
