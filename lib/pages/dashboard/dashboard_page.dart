import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/global/widget.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/new_consumption_dialog.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';
import 'package:statisfuel/pages/dashboard/state/state.dart';
import 'package:statisfuel/pages/dashboard/stats_card.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/app_config.dart';
import 'package:statisfuel/utils/num.dart';

typedef Selector<T> = BlocSelector<DashboardCubit, DashboardState, T>;

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
        spacing: AppConfig.spacing * 2,
        children: [
          Center(
            child: Text(
              t.dashboard.title,
              style:
                  const TextStyle(fontSize: 24, fontFamily: 'MPLUSRounded1c'),
            ),
          ),
          IntrinsicHeight(
            child: Row(
              spacing: AppConfig.spacing * 2,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: StatsCard<double>(
                    title: t.dashboard.averageConsumption,
                    selector: (state) => state.averageConsumption,
                    formatter: (value) =>
                        value.toFormattedString(unit: t.unit.litersPer100km),
                    icon: Icons.speed,
                    details: t.dashboard.forThePastYear,
                  ),
                ),
                Expanded(
                  child: StatsCard<double?>(
                    title: t.dashboard.averageCostPerKm,
                    selector: (state) => state.averageCostPerKm,
                    formatter: (value) => value.toFormattedString(
                      unit: t.unit.costPerKm,
                      format: NumberFormat('#,##0.000', 'fr_FR'),
                    ),
                    icon: Icons.trending_flat,
                    details: t.dashboard.forThePastYear,
                  ),
                ),
              ],
            ),
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
