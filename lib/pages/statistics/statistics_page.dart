import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/pages/statistics/charts/daily_consumption.dart';
import 'package:statisfuel/pages/statistics/state/cubit.dart';
import 'package:statisfuel/pages/statistics/state/state.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

import '../../global/banner/banner.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StatisticsCubit(consumptionRepository: GetIt.I<ConsumptionRepository>())..loadConsumptions(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const BannerSection(imageUrl: 'assets/images/statistiques.png'),
            const SizedBox(
              height: 31,
            ),
            const Center(
              child: Text(
                'Statistiques',
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.w100,
                  fontFamily: 'MPLUSRounded1c',
                ),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            BlocBuilder<StatisticsCubit, StatisticsState>(
              builder: (BuildContext context, StatisticsState state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.errorMessage != null) {
                  return Center(
                    child: Text(state.errorMessage!),
                  );
                }
                return Center(
                  child: DailyConsumptionChart(
                    data: state.consumptions
                        .map(
                          (consumption) {
                          if (consumption.litersPer100km == null) {
                            return null;
                          }
                          return {
                            'date': consumption.date,
                            'value': consumption.litersPer100km,
                          };
                          },
                        )
                        .where((element) => element != null)
                        .cast<Map<String, dynamic>>()
                        .toList(),
                    title: 'Consommation journalière',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
