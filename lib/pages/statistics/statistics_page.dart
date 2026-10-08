import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/pages/statistics/charts/default/chart_point.dart';
import 'package:statisfuel/pages/statistics/charts/daily_consumption.dart';
import 'package:statisfuel/pages/statistics/charts/monthly_expenses.dart';
import 'package:statisfuel/pages/statistics/state/cubit.dart';
import 'package:statisfuel/pages/statistics/state/state.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';
import 'package:statisfuel/theme/app_config.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StatisticsCubit(
        consumptionRepository: GetIt.I<ConsumptionRepository>(),
      )..loadConsumptions(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.padding * 3),
        child: Column(
          spacing: AppConfig.spacing,
          children: [
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
                return Column(
                  spacing: AppConfig.spacing * 2,
                  children: [
                    DailyConsumptionChart(
                      points: state.consumptions,
                    ),
                    MonthlyExpensesChart(
                      points: state.consumptions,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
