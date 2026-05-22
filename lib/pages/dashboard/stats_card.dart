import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/global/card.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';
import 'package:statisfuel/pages/dashboard/state/state.dart';
import 'package:statisfuel/theme/app_config.dart';

typedef Selector<M> = BlocSelector<DashboardCubit, DashboardState, M>;

class StatsCard<T> extends StatelessWidget {
  final String title;
  final Function(DashboardState) selector;
  final String Function(T value) formatter;
  final IconData icon;
  final String? details;

  const StatsCard({
    super.key,
    required this.title,
    required this.selector,
    required this.formatter,
    required this.icon,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    return TVCard(
      title: (context) => title,
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Selector(
          selector: (state) =>
              (value: selector(state), isLoading: state.isLoading),
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
                      formatter(data.value),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    if (details != null)
                      Text(
                        details!,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                  ],
                ),
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
                    icon,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
