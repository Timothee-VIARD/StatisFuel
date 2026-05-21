import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/global/widget.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/new_consumption_dialog.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/app_config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
        consumptionRepository: GetIt.I<ConsumptionRepository>(),
      ),
      child: Builder(
        builder: (context) {
          return const DashboardView();
        },
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConfig.padding * 3),
      child: Column(
        spacing: AppConfig.spacing,
        children: [
          Center(
            child: Text(
              t.dashboard.title,
              style:
                  const TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
          TVCard(
            title: (context) => t.dashboard.title,
            content: const Text('Aucune consommation pour le moment.'),
          ),
          TVCard(
            title: (context) => t.dashboard.title,
            content: const Text('Aucune consommation pour le moment.'),
          ),
          TVCard(
            title: (context) => t.dashboard.title,
            content: const Text('Aucune consommation pour le moment.'),
          ),
          TVCard(
            title: (context) => t.dashboard.title,
            content: const Text('Aucune consommation pour le moment.'),
          ),
          const TVCard(
            content: Text('Aucune consommation pour le moment.'),
          ),
          const Spacer(),
          TVButton(
            onPressed: () => buildItemCreation(context),
            child: const Text('Ajouter une consommation'),
          ),
        ],
      ),
    );
  }
}
