import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/global/dashed_arrow.dart';
import 'package:statisfuel/global/widget.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/new_consumption_dialog.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';
import 'package:statisfuel/pages/dashboard/state/state.dart';
import 'package:statisfuel/pages/dashboard/stats_card.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/app_config.dart';
import 'package:statisfuel/utils/date.dart';
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
      child: SingleChildScrollView(
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
                    child: StatsCard<double?>(
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
            buildAddConsumptionButton(context),
            buildLastConsumptionInfo(),
            buildAverageDistance(),
            IntrinsicHeight(
              child: Row(
                spacing: AppConfig.spacing * 2,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: StatsCard<double?>(
                      title: t.dashboard.distanceDriven,
                      selector: (state) => state.totalDistance,
                      formatter: (value) => value.toFormattedString(
                          unit: t.unit.distance,
                          format: NumberFormat('#,##0', 'fr_FR')),
                      icon: Icons.directions_car,
                      details: t.dashboard.forThePastYear,
                    ),
                  ),
                  Expanded(
                    child: StatsCard<double?>(
                      title: t.dashboard.expense,
                      selector: (state) => state.totalCost,
                      formatter: (value) => value.toFormattedString(
                        unit: t.unit.price,
                      ),
                      icon: Icons.euro,
                      details: t.dashboard.forThePastYear,
                    ),
                  ),
                ],
              ),
            ),
            StatsCard<int?>(
              title: t.dashboard.fillUps,
              selector: (state) => state.totalFillUps,
              formatter: (value) => value.toString(),
              icon: Icons.local_gas_station,
              details: t.dashboard.forThePastYear,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAverageDistance() {
  return TVCard(
    title: (context) => t.dashboard.averageDistanceBetweenFillUps,
    content: ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Selector(
        selector: (state) => (
          value: state.averageDistance,
          isLoading: state.isLoading,
          lastConsumption: state.lastConsumption
        ),
        builder: (context, data) {
          if (data.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            spacing: AppConfig.spacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    data.value.toFormattedString(unit: t.unit.distance),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(t.dashboard.forThePastYear),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.directions_car,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Expanded(child: DashedArrow()),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.local_gas_station,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: '${t.dashboard.estimatedDistanceBeforeNextFillUp} : ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: data.lastConsumption?.distance
                            .toFormattedString(unit: t.unit.distance),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget buildAddConsumptionButton(BuildContext context) {
  return TVCard(
    title: (context) => t.dashboard.quickAction,
    content: ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Column(
        spacing: AppConfig.spacing,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => buildItemCreation(context),
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(alpha: 0.20),
              ),
              child: Icon(
                Icons.add,
                size: 48,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Text(t.dashboard.addConsumption),
        ],
      ),
    ),
  );
}

Widget buildLastConsumptionInfo() {
  return TVCard(
    title: (context) => t.dashboard.lastConsumptionInfo,
    content: ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Selector(
        selector: (state) => state.lastConsumption,
        builder: (context, value) {
          Widget row({
            required IconData icon,
            required String label,
          }) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: AppConfig.spacing * 2,
                  children: [
                    Icon(
                      icon,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            );
          }

          return IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: AppConfig.spacing,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    row(
                      icon: Icons.calendar_today,
                      label: t.dashboard.date,
                    ),
                    row(
                      icon: Icons.price_change_outlined,
                      label: t.dashboard.literPrice,
                    ),
                    row(
                      icon: Icons.local_gas_station,
                      label: t.dashboard.volume,
                    ),
                    row(
                      icon: Icons.money,
                      label: t.dashboard.cost,
                    ),
                    row(
                      icon: Icons.directions_car,
                      label: t.dashboard.distance,
                    ),
                    row(
                      icon: Icons.speed,
                      label: t.dashboard.consumption,
                    ),
                  ],
                ),
                IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (value?.date).toFormattedString(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        (value?.pricePerLiter).toFormattedString(
                          unit: t.unit.pricePerLiter,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        (value?.liters).toFormattedString(
                          unit: t.unit.volume,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        (value?.totalPrice).toFormattedString(
                          unit: t.unit.price,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        (value?.distance).toFormattedString(
                          unit: t.unit.distance,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        (value?.litersPer100km).toFormattedString(
                          unit: t.unit.litersPer100km,
                        ),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
