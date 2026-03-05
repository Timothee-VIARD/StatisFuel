import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statisfuel/i18n/strings.g.dart';
import 'package:statisfuel/pages/dashboard/dialogs/consumption_form/consumption_form.dart';
import 'package:statisfuel/pages/dashboard/state/cubit.dart';

void buildItemCreation(BuildContext context) {
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
                          context
                              .read<DashboardCubit>()
                              .createConsumption(consumption);
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
