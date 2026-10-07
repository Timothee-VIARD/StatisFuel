import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/global/card.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';
import 'package:statisfuel/pages/dashboard/state/state.dart';
import 'package:statisfuel/theme/app_config.dart';

typedef Selector<M> = BlocSelector<DashboardCubit, DashboardState, M>;

/// Carte affichant une valeur sélectionnée depuis l'état du tableau de bord.
///
/// Le paramètre de type [T] correspond au type de la valeur sélectionnée. La
/// valeur est affichée avec [formatter] et peut également être rendue sous
/// forme de contenu personnalisé avec [content].
class StatsCard<T> extends StatelessWidget {
  /// Texte affiché dans l'en-tête de la carte.
  final String title;

  /// Sélectionne la valeur à afficher depuis l'état actuel du tableau de bord.
  final Function(DashboardState) selector;

  /// Convertit la valeur sélectionnée en texte affiché dans la carte.
  final String Function(T value)? formatter;

  /// Construit le contenu visuel affiché sous la valeur formatée.
  final Widget Function(T value) content;

  /// Texte facultatif affiché sous la valeur formatée.
  final String? details;

  /// Crée une carte affichant une valeur du tableau de bord.
  ///
  /// [selector], [formatter] et [content] doivent tous utiliser le même type
  /// de valeur [T].
  const StatsCard({
    super.key,
    required this.title,
    required this.selector,
    this.formatter,
    required this.content,
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
                    if (formatter != null)
                      Text(
                        formatter!(data.value),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    if (details != null) Text(details!),
                  ],
                ),
                content(data.value),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// [StatsCard] dont le contenu personnalisé est une icône adaptée au thème.
class StatsCardIcon<T> extends StatsCard<T> {
  /// Icône affichée sous la valeur formatée.
  final IconData icon;

  /// Crée une carte de statistiques dont le contenu est une icône.
  StatsCardIcon({
    super.key,
    required super.title,
    required super.selector,
    required super.formatter,
    required this.icon,
    super.details,
  }) : super(
          content: (value) => Builder(
            builder: (context) {
              return Container(
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
              );
            },
          ),
        );
}
