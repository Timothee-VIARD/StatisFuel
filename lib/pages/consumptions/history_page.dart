import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:statisfuel/global/snackBar/controllers/cubit.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/consumptions/card.dart';
import 'package:statisfuel/pages/consumptions/new_consumption/form.dart';
import 'package:statisfuel/repositories/consumption/implementation.dart';

import 'state/cubit.dart';
import 'state/state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HistoryCubit(consumptionRepository: GetIt.I<ConsumptionRepository>())..loadConsumptions(),
      child: Builder(
        builder: (context) {
          return const HistoryView();
        },
      ),
    );
  }
}

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8),
          //   child: BannerSection(imageUrl: 'assets/images/historique.png'),
          // ),
          // const SizedBox(height: 31),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Historique',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'MPLUSRounded1c',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MenuAnchor(
                  builder: (BuildContext context, MenuController controller, Widget? child) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        controller.open();
                      },
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () {
                        context.read<HistoryCubit>().exportToCsv();
                      },
                      child: Text(t.global.exportToCSV),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        context.read<HistoryCubit>().importFromCsv();
                      },
                      child: Text(t.global.importFromCSV),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext contextDialog) {
                            return AlertDialog(
                              title: Text(t.global.confirm),
                              content: Text(t.consumption.warningDeleteAll),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(contextDialog).pop();
                                  },
                                  child: Text(t.global.forms.cancel),
                                ),
                                ElevatedButton(
                                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                                  onPressed: () {
                                    context.read<HistoryCubit>().deleteAllConsumptions();
                                    Navigator.of(contextDialog).pop();
                                  },
                                  child: Text(
                                    t.global.delete,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(t.global.deleteAll),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocConsumer<HistoryCubit, HistoryState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  context.read<NotificationCubit>().showError(state.errorMessage!);
                } else if (state.successMessage != null) {
                  context.read<NotificationCubit>().showSuccess(state.successMessage!);
                }
              },
              buildWhen: (previous, current) {
                return previous.consumptions != current.consumptions;
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.consumptions.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_gas_station, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          t.consumption.noData,
                          style: const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                } else {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: RawScrollbar(
                      controller: scrollController,
                      interactive: true,
                      thumbVisibility: true,
                      crossAxisMargin: -8,
                      radius: const Radius.circular(8),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<HistoryCubit>().loadConsumptions();
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemCount: state.consumptions.length,
                          itemBuilder: (context, index) {
                            final consumption = state.consumptions[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 4),
                              child: ConsumptionCard(
                                consumption: consumption,
                                onSave: (consumption, id) {
                                  context
                                      .read<HistoryCubit>()
                                      .submitConsumption(consumption, id: id);
                                },
                                onDelete: (id) {
                                  context.read<HistoryCubit>().deleteConsumption(id);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _buildItemCreation(context),
            child: const Text('Ajouter une consommation'),
          ),
        ],
      ),
    );
  }

  void _buildItemCreation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext contextDialog) {
        return Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Dialog(
                insetPadding: EdgeInsets.zero,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.consumption.modify,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => {
                                Navigator.of(contextDialog).pop(),
                              },
                            ),
                          ],
                        ),
                        ConsumptionForm(
                          (consumption, id) {
                            context.read<HistoryCubit>().submitConsumption(consumption, id: id);
                            Navigator.of(contextDialog).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
